import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedStatusText extends StatefulWidget {
  final List<String> messages;
  final Duration duration;
  final TextStyle? style;
  final VoidCallback? onCompleted;

  const AnimatedStatusText({
    super.key,
    required this.messages,
    this.duration = const Duration(seconds: 2),
    this.style,
    this.onCompleted,
  });

  @override
  State<AnimatedStatusText> createState() => _AnimatedStatusTextState();
}

class _AnimatedStatusTextState extends State<AnimatedStatusText> {
  late String _currentMessage;
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    assert(
      widget.messages.isNotEmpty,
      'AnimatedStatusText requires at least one message.',
    );

    _currentMessage = widget.messages.first;

    _timer = Timer.periodic(widget.duration, (timer) {
      if (!mounted) return;

      if (_currentIndex < widget.messages.length - 1) {
        setState(() {
          _currentIndex++;
          _currentMessage = widget.messages[_currentIndex];
        });
      } else {
        timer.cancel();
        widget.onCompleted?.call();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Text(
        _currentMessage,
        key: ValueKey(_currentMessage),
        style: widget.style,
        textAlign: TextAlign.center,
      ),
    );
  }
}