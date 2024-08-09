import 'package:flutter/material.dart';
import 'package:twitterx/core/constants/constant.dart';

class CircularLoadingWithText extends StatelessWidget {
  final String loadingText;
  const CircularLoadingWithText({super.key, String? text})
      : loadingText = text ?? 'Loading ...';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            color: kPrimaryColor,
            strokeWidth: 2,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          loadingText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14,
              ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
