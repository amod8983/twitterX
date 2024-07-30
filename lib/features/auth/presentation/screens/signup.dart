import 'package:flutter/material.dart';
import 'package:twitterx/core/constants/constant.dart';
import 'package:twitterx/core/utils/debouncer.dart';
import 'package:twitterx/core/widgets/buttons/twitter_elevated_button.dart';
import 'package:twitterx/features/auth/presentation/widgets/user_details.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _debouncer = Debouncer(milliseconds: 500);

  final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  // Form data
  String _email = '';
  String _password = '';
  bool _isFormValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  void _validateForm() {
    if (_isEmailValid && _isPasswordValid) {
      setState(() {
        _isFormValid = _formKey.currentState?.validate() ?? false;
      });
    } else {
      _isFormValid = false;
    }
  }

  void _verifyEmail(value) {
    _debouncer.run(() {
      setState(() {
        _isEmailValid = _emailKey.currentState?.validate() ?? false;
        _validateForm();
      });
    });
  }

  void _verifyPassword(value) {
    _debouncer.run(() {
      setState(() {
        _isPasswordValid = _passwordKey.currentState?.validate() ?? false;
        _validateForm();
      });
    });
  }

  void _navigateToUserDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => UserDetails(
          email: _email,
          password: _password,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kDefaultAppBar,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Create your account',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color,
                          ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    TextFormField(
                      key: _emailKey,
                      onChanged: _verifyEmail,
                      cursorColor: kPrimaryColor,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                          ),
                      decoration: const InputDecoration(
                        labelText: 'Email address',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      autofocus: true,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        _email = val!.trim();
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      key: _passwordKey,
                      onChanged: _verifyPassword,
                      cursorColor: kPrimaryColor,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                          ),
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.trim().length < 6) {
                          return 'Password must be atleast 8 character long';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        _password = val!.trim();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TwitterElevatedButton(
                      buttonText: 'Next',
                      disabled: !_isFormValid,
                      onTap: () {
                        _navigateToUserDetails(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
