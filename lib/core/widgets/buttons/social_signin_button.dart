import 'package:flutter/material.dart';

class SocialSigninButton extends StatelessWidget {
  final String buttonText;
  final String imageURL;
  final void Function() onTap;
  const SocialSigninButton(
      {super.key,
      required this.buttonText,
      required this.imageURL,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 24,
        ),
        elevation: 2.0,
        backgroundColor: Colors.white,
        side: const BorderSide(
            color: Color.fromARGB(181, 158, 158, 158), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageURL,
            height: 24,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            buttonText,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          )
        ],
      ),
    );
  }
}
