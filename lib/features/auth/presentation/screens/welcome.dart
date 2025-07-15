import 'package:flutter/material.dart';
import 'package:twitterx/core/constants/constant.dart';
import 'package:twitterx/core/widgets/buttons/social_signin_button.dart';
import 'package:twitterx/core/widgets/buttons/twitter_elevated_button.dart';
import 'package:twitterx/core/widgets/divider_with_text.dart';
import 'package:twitterx/features/auth/presentation/screens/login.dart';
import 'package:twitterx/features/auth/presentation/screens/signup.dart';
import 'package:twitterx/features/auth/presentation/widgets/term_and_condition.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  void navigateToSignup(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const Signup()),
    );
  }

  void navigateToLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kDefaultAppBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 140,
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
              height: 140,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: SocialSigninButton(
                    buttonText: 'Continue with Google',
                    imageURL: 'assets/logo/search.png',
                    onTap: () {},
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
                    child: TwitterElevatedButton(
                      buttonText: 'Create account',
                      disabled: false,
                      onTap: () {
                        navigateToSignup(context);
                      },
                    )),
                const SizedBox(
                  height: 28,
                ),
                const TermAndCondition(),
                const SizedBox(
                  height: 28,
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
                      onPressed: (){
                        navigateToLogin(context);
                      },
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
