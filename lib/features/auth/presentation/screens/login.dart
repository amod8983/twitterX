import 'package:flutter/material.dart';
import 'package:twitterx/core/constants/constant.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kDefaultAppBar,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            child: Form(
              key: _formKey,
              child: Column(),
            ),
          )
        ],
      ),
    );
  }
}
