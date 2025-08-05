import 'dart:ui';

import 'package:cross_ui_project/animations.dart';
import 'package:flutter/material.dart';

class AnimatedFloatingActionButton extends StatefulWidget {
  const AnimatedFloatingActionButton({
    super.key,
    this.onPressed,
    this.elevation,
    required this.child,
    required this.animation,
  });

  final Widget? child;
  final Animation<double> animation;
  final VoidCallback? onPressed;
  final double? elevation;

  @override
  State<AnimatedFloatingActionButton> createState() =>
      _AnimatedFloatingActionButtonState();
}

class _AnimatedFloatingActionButtonState
    extends State<AnimatedFloatingActionButton> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;

  late final Animation<double> _scaleAnimation = ScaleAnimation(
    parent: widget.animation,
  );

  late final Animation<double> _shapeAnimation = ShapeAnimation(
    parent: widget.animation,
  );

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: FloatingActionButton(
        elevation: widget.elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(lerpDouble(30, 15, _shapeAnimation.value)!),
          ),
        ),
        backgroundColor: _colorScheme.tertiaryContainer,
        focusColor: _colorScheme.onTertiaryContainer,
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}
