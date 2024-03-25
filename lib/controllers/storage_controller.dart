import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/models/user_model.dart';
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

  Future uploadImage(user) async {
    final storageRepo = ref.read(storageRepoProvider);
    final userRepo = ref.read(userRepoProvider);
    try {
      ImagePicker imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
      final fileUrl = await storageRepo.uploadImage(file);

      user['imgUrl'] = fileUrl;
      UserModel userUpdated = UserModel.fromJson(user);

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
