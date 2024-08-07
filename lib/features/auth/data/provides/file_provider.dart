import "dart:io";

import 'package:path/path.dart' as path;
import "package:firebase_storage/firebase_storage.dart";

class FileProvider {
  final Reference? _storageReference;

  FileProvider({Reference? storageReference})
      : _storageReference = storageReference ?? FirebaseStorage.instance.ref();

  Future<String> uploadProfilePhoto(File profilePhoto, String userId) async {
    String fileName = path.basename(profilePhoto.path);
    String profilePhotoName = userId + DateTime.now().toString() + fileName;

    final photoStorageReference = _storageReference!
        .child("users_profile_photo")
        .child('$profilePhotoName.jpg');
    await photoStorageReference.putFile(profilePhoto);
    return photoStorageReference.getDownloadURL();
  }
}
