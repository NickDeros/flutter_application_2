import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/controllers/user_controller.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:flutter_application_2/repositories/auth_repository.dart';
import 'package:flutter_application_2/repositories/storage_repository.dart';
import 'package:flutter_application_2/repositories/user_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_controller.g.dart';

@riverpod
class ImageUpload extends _$ImageUpload {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future uploadImage(user, String imgMethod) async {
    final storageRepo = ref.read(storageRepoProvider);
    final userRepo = ref.read(userRepoProvider);
    // ref.read(userUpdateProvider(user['uid']));

    try {
      ImagePicker imagePicker = ImagePicker();

      var method = null;
      if (imgMethod == 'camera') {
        method = ImageSource.camera;
      } else if (imgMethod == 'gallery') {
        method = ImageSource.gallery;
      }

      XFile? file = await imagePicker.pickImage(source: method, imageQuality: 50);
      final fileUrl = await storageRepo.uploadImage(file);

      user['imgUrl'] = fileUrl;
      UserModel userUpdated = UserModel.fromJson(user);
      ref.invalidate(userUpdateProvider(user['uid']));

      await userRepo.editUser(user: userUpdated);
      debugPrint(user.toString());
      debugPrint('fileToRepo');
      debugPrint(fileUrl);
      debugPrint('file.path');
      debugPrint('${file?.path}');
    } catch (e) {
      debugPrint('e uploadImage');
      debugPrint(e.toString());
    }
  }
}
