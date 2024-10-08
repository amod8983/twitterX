//Flutter package
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Dependency
import 'package:twitterx/main.dart';
import 'package:twitterx/core/utils/debouncer.dart';
import 'package:twitterx/core/constants/constant.dart';
import 'package:twitterx/core/widgets/circular_loading_with_text.dart';
import 'package:twitterx/core/widgets/buttons/twitter_elevated_button.dart';
import 'package:twitterx/features/auth/business_logic/auth/auth_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

  void _requestLogin() {
    _formKey.currentState?.save();
    context
        .read<AuthBloc>()
        .add(AuthLoginRequested(email: _email, password: _password));
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, authState) {
        if (authState is AuthSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
            (_) => false,
          );
        } else if (authState is AuthError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(authState.error)),
            );
        }
      },
      child: Scaffold(
        appBar: kDefaultAppBar,
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Enter your email address and password to login into your account',
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
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthProcessing) {
                            return CircularLoadingWithText(
                              text: state.message,
                            );
                          }
                          return TwitterElevatedButton(
                              buttonText: 'Login',
                              disabled: !_isFormValid,
                              onTap: _requestLogin);
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
      ),
    );
  }
}
