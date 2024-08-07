import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitterx/features/auth/data/models/user_details.dart';
import 'package:twitterx/features/auth/data/provides/file_provider.dart';

class UserDetailsProvider {
  final FirebaseFirestore _firebaseFirestore;
  UserDetailsProvider({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Future<DocumentReference<Map<String, dynamic>>> createUser(
    UserDetails userDetails,
  ) async {
    String profilePhotoUrl = '';

    // If the user data contains profile photo, then first upload the photo
    if (userDetails.profilePhoto != null) {
      profilePhotoUrl = await FileProvider()
          .uploadProfilePhoto(userDetails.profilePhoto!, userDetails.userId);
    }

    // Add a new entry in user collection.
    UserDetails updatedUserDetails =
        userDetails.copyWith(profilePhotoUrl: profilePhotoUrl);
    return _firebaseFirestore
        .collection("users")
        .add(updatedUserDetails.toMap());
  }
}
