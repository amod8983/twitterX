import 'package:flutter/material.dart';

class TwitterElevatedButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;
  const TwitterElevatedButton(
      {super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).textTheme.bodyMedium!.color,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 24,
        ),
        elevation: 2.0,
      ),
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
      ),
    );
  }
}
