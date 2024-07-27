import 'package:flutter/material.dart';
import 'package:twitterx/core/constants/constant.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'By signing up, you agree to our ',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14,
            ),
        children: [
          TextSpan(
            text: 'Terms',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
          TextSpan(
            text: ', ',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                ),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
          TextSpan(
            text: ' and ',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                ),
          ),
          TextSpan(
            text: 'Cookie use',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
          TextSpan(
            text: '.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                ),
          ),
        ],
      ),
    );
  }
}
