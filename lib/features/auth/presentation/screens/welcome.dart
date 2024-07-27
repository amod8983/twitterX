import 'package:flutter/material.dart';
import 'package:twitterx/core/constants/constant.dart';
import 'package:twitterx/core/widgets/divider_with_text.dart';
import 'package:twitterx/features/auth/presentation/widgets/term_and_condition.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo/twitter.png',
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 160,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * (2 / 3),
              child: Text(
                'See what\'s happening in the world right now.',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
              ),
            ),
            const SizedBox(
              height: 160,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 72,
                    ),
                    elevation: 2.0,
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                        color: Color.fromARGB(181, 158, 158, 158), width: 1),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/logo/search.png',
                        height: 24,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Continue with Google',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const DividerWithText(text: 'or'),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).textTheme.bodyMedium!.color,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 24,
                      ),
                      elevation: 2.0,
                    ),
                    child: Text(
                      'Create account',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                const TermAndCondition(),
                const SizedBox(
                  height: 48,
                ),
                Row(
                  children: [
                    Text(
                      'Have an account already?',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Log in',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
