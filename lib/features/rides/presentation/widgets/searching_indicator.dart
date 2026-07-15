import 'dart:async';

import 'package:flutter/material.dart';

class SearchingIndicator extends StatefulWidget {
  const SearchingIndicator({super.key});

  @override
  State<SearchingIndicator> createState() => _SearchingIndicatorState();
}

class _SearchingIndicatorState extends State<SearchingIndicator> {
  static const int _dotCount = 4;

  int _activeDot = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(milliseconds: 350),
      (_) {
        if (!mounted) return;

        setState(() {
          _activeDot = (_activeDot + 1) % _dotCount;
        });
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      _dotCount,
      (index) {
        final active = index == _activeDot;

        return SizedBox(
          width: 18,
          height: 18,
          child: Center(
            child: AnimatedScale(
              scale: active ? 1.35 : 0.85,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: active
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
}