import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterx/core/constants/constant.dart';
import 'package:twitterx/features/auth/business_logic/auth/auth_bloc.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _MyFeedScreen();
}

class _MyFeedScreen extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kDefaultAppBar,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          context.read<AuthBloc>().add(const AuthLogoutRequested());
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
