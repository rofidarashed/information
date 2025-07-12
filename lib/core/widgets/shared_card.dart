import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final String text;
  final bool isError;

  const AppCard({super.key, required this.text, this.isError = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isError ? Colors.red.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.lightGreen.withOpacity(0.2),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontStyle: FontStyle.italic,
          height: 1.5,
          color: isError ? Colors.red.shade900 : Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
