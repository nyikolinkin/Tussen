import 'package:flutter/material.dart';

class TussenOtpField extends StatefulWidget {
  final int length;
  final Function(String)? onCompleted;

  const TussenOtpField({
    super.key,
    this.length = 6,
    this.onCompleted,
  });

  @override
  State<TussenOtpField> createState() => _TussenOtpFieldState();
}

class _TussenOtpFieldState extends State<TussenOtpField> {
  late final List<TextEditingController> controllers;
  late final List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();

    controllers =
        List.generate(widget.length, (_) => TextEditingController());

    focusNodes =
        List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }

    for (final node in focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < widget.length - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }

    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }

    final code = controllers.map((c) => c.text).join();

    if (code.length == widget.length) {
      widget.onCompleted?.call(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (index) => SizedBox(
          width: 52,
          height: 60,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,

            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),

            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: Colors.grey.shade100,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Colors.amber,
                  width: 2,
                ),
              ),
            ),

            onChanged: (value) => _onChanged(value, index),
          ),
        ),
      ),
    );
  }
}