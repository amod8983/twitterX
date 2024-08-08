// Flutter package
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// dependency
import 'package:twitterx/core/constants/constant.dart';
import 'package:twitterx/core/widgets/buttons/twitter_elevated_button.dart';
import 'package:twitterx/features/auth/business_logic/auth/auth_bloc.dart';
import 'package:twitterx/features/auth/presentation/widgets/user_image_picker.dart';

final formatter = DateFormat('dd-MMMM-yyyy');

enum Gender { male, female, other }

class UserDetails extends StatefulWidget {
  final String email;
  final String password;
  const UserDetails({super.key, required this.email, required this.password});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();

  final _usernameKey = GlobalKey<FormFieldState>();
  final _nameKey = GlobalKey<FormFieldState>();
  final _dobKey = GlobalKey<FormFieldState>();

  // user details
  String _username = '';
  String _name = '';
  String _dob = '';
  Gender? _gender = Gender.male;
  File? _pickedImage;

  void _showDatePicker() async {
    final now = DateTime.now();
    final lastDate = DateTime(now.year - 100, now.month, now.day);
    var pickedDate = await showDatePicker(
        context: context, firstDate: lastDate, lastDate: now, initialDate: now);

    if (pickedDate != null) {
      setState(() {
        _dob = formatter.format(pickedDate);
        _dobController.text = _dob;
      });
    }
  }

  void _submitUserData() {
    bool isUsernameValid = _usernameKey.currentState!.validate();
    bool isNameValid = _nameKey.currentState!.validate();
    bool isDobValid = _dobKey.currentState!.validate();

    if (!isUsernameValid || !isNameValid || !isDobValid) {
      return;
    } else {
      _username = _usernameController.text;
      _name = _nameController.text;
      _dob = _dobController.text;
      // Continue with signup
      context.read<AuthBloc>().add(
            AuthSignupRequested(
              email: widget.email,
              password: widget.password,
            ),
          );
    }
  }

  @override
  void initState() {
    super.initState();
    _dobController.text = _dob;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kDefaultAppBar,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Enter your details',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  UserImagePicker(
                    pickImage: (pickedImage) {
                      _pickedImage = pickedImage;
                    },
                  ),
                  TextFormField(
                    key: _usernameKey,
                    onChanged: (_) {},
                    maxLength: 50,
                    cursorColor: kPrimaryColor,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                        ),
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    autofocus: true,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          value.length < 8) {
                        return 'Username should be atleast 8 character';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    key: _nameKey,
                    onChanged: (_) {},
                    cursorColor: kPrimaryColor,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                        ),
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    key: _dobKey,
                    controller: _dobController,
                    onTap: () {
                      _showDatePicker();
                    },
                    cursorColor: kPrimaryColor,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                        ),
                    decoration: const InputDecoration(
                      labelText: 'Date of birth',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    readOnly: true,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a valid DOB';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Gender',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio<Gender>(
                        value: Gender.male,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      Text(
                        'Male',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      Radio<Gender>(
                        value: Gender.female,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      Text(
                        'Female',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      Radio<Gender>(
                        value: Gender.other,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      Text(
                        'Other',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                    ],
                  )
                ],
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
                        buttonText: 'Create account',
                        disabled: false,
                        onTap: _submitUserData),
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
