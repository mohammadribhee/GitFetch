import 'package:flutter/material.dart';

class ReloadButton extends StatelessWidget {
  final bool isLoading;
  final Function() onPressed;

  const ReloadButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            isLoading ? Colors.grey : const Color.fromARGB(255, 0, 0, 0),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            Colors.white,
          ),
        ),
        child: const Text('Reload Data'),
      ),
    );
  }
}
