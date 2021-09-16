import 'dart:math';

import 'package:flutter/material.dart';

class FlippingSwitch extends StatefulWidget {
  const FlippingSwitch(
      {Key? key,
      required this.color,
      required this.background,
      required this.leftLabel,
      required this.rightLabel,
      required this.onChange,
      required this.tabHeight,
      required this.tabWidth})
      : super(key: key);

  final Color color;
  final Color background;
  final String leftLabel;
  final String rightLabel;
  final double tabHeight;
  final double tabWidth;

  final void Function(bool) onChange;
  @override
  _FlippingSwitchState createState() => _FlippingSwitchState();
}

class _FlippingSwitchState extends State<FlippingSwitch>
    with TickerProviderStateMixin {
  late AnimationController _tiltController;
  late AnimationController _flipController;
  double _directionMultiplier = 1;
  late Animation _tiltAnimation;
  final double _maxTiltAngle = pi / 6;
  @override
  void initState() {
    super.initState();

    _tiltController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 1500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _tiltController.reverse();
        }
      });

    _tiltAnimation = CurvedAnimation(
        parent: _tiltController,
        curve: Curves.easeOut,
        reverseCurve: Curves.elasticOut.flipped);

    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _jumpToMode(true);
  }

  @override
  void dispose() {
    _flipController.dispose();
    _tiltController.dispose();
    super.dispose();
  }

  void _jumpToMode(bool leftEnabled) {
    _flipController.value = leftEnabled ? 1 : 0;
  }

  void _flipSwitch() {
    if (_flipController.isCompleted) {
      _directionMultiplier = -1;
      _tiltController.forward();
      _flipController.reverse();

      widget.onChange.call(false);
    } else {
      _directionMultiplier = 1;
      _flipController.forward();
      _tiltController.forward();
      widget.onChange.call(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _tiltAnimation,
      builder: (context, tabs) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(
                _tiltAnimation.value * _maxTiltAngle * _directionMultiplier),
          alignment: FractionalOffset(0.5, 1.0),
          child: tabs,
        );
      },
      child: Stack(
        children: [
          _buildTabsBackground(),
          AnimatedBuilder(
            animation: _flipController,
            builder: (context, snapshot) {
              return _buildFlippingSwitch((pi * _flipController.value));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabsBackground() {
    return GestureDetector(
      onTap: _flipSwitch,
      child: Container(
        width: widget.tabWidth,
        height: widget.tabHeight,
        decoration: BoxDecoration(
          color: widget.background,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(width: 5, color: widget.color),
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  widget.leftLabel,
                  style: TextStyle(
                    color: widget.color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  widget.rightLabel,
                  style: TextStyle(
                    color: widget.color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlippingSwitch(double angle) {
    final isLeft = angle > (pi / 2);
    final transformAngle = isLeft ? angle - pi : angle;

    return Positioned(
      top: 0,
      bottom: 0,
      right: isLeft ? null : 0,
      left: isLeft ? 0 : null,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(transformAngle),
        alignment: isLeft ? FractionalOffset(1, 1) : FractionalOffset(0, 1),
        child: Container(
          width: 125,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.only(
                topRight: isLeft ? Radius.zero : Radius.circular(32),
                bottomRight: isLeft ? Radius.zero : Radius.circular(32),
                bottomLeft: isLeft ? Radius.circular(32) : Radius.zero,
                topLeft: isLeft ? Radius.circular(32) : Radius.zero),
          ),
          child: Center(
            child: Text(
              isLeft ? widget.leftLabel : widget.rightLabel,
              style: TextStyle(
                  color: widget.background,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
