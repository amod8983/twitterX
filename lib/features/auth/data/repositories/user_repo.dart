import 'package:twitterx/features/auth/data/models/file_model.dart';
import 'package:twitterx/features/auth/data/models/user_details.dart';
import 'package:twitterx/features/auth/data/provides/user_details_provider.dart';

class UserRepo {
  final UserDetailsProvider userProvider;
  const UserRepo({required this.userProvider});

  Future<UserDetails> createUser(UserDetails userDetails, FileModel? profilePhoto) {
    try {
      return userProvider.createUser(userDetails, profilePhoto);
    } catch (e) {
      rethrow;
    }
  }
}