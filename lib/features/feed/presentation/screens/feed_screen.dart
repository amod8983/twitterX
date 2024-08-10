import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Dependencies
import 'package:twitterx/core/constants/constant.dart';
import 'package:twitterx/features/auth/business_logic/auth/auth_bloc.dart';
import 'package:twitterx/features/feed/presentation/widgets/bottom_navigation.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _MyFeedScreen();
}

class _MyFeedScreen extends State<FeedScreen> {
  int _currentIndex = 0;

  void _onIndexChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onIndexChange: _onIndexChange,
      ),
    );
  }
}
