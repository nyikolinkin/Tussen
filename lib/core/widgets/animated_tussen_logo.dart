import 'package:flutter/material.dart';

import 'tussen_logo.dart';

class AnimatedTussenLogo extends StatefulWidget {
  final double size;

  const AnimatedTussenLogo({
    super.key,
    this.size = 170,
  });

  @override
  State<AnimatedTussenLogo> createState() => _AnimatedTussenLogoState();
}

class _AnimatedTussenLogoState extends State<AnimatedTussenLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _scale = Tween<double>(
      begin: 0.96,
      end: 1.04,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: TussenLogo(
        size: widget.size,
      ),
    );
  }
}