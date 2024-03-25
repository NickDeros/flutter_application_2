import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_repository.g.dart';

// Create a storage reference from our app

class StorageRepo {
  const StorageRepo(this.firebaseStorage);
  final Reference firebaseStorage;

  Future<String> uploadImage(img) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      // Create a reference to 'images/mountains.jpg'
      final imagesRef = firebaseStorage.child("images/$fileName.jpg");

      // Store the file
      final uploadTask = await imagesRef.putFile(
          File(img.path), SettableMetadata(contentType: "image/jpeg"));
      debugPrint('uploadTask');
      debugPrint(uploadTask.toString());
      return imagesRef.getDownloadURL();
    } catch (e) {
      //catch error
      debugPrint('e storage repo');
      debugPrint(e.toString());
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
Reference firebaseStorage(FirebaseStorageRef ref) {
  return FirebaseStorage.instance.ref();
}

@Riverpod(keepAlive: true)
StorageRepo storageRepo(StorageRepoRef ref) {
  return StorageRepo(ref.watch(firebaseStorageProvider));
}
