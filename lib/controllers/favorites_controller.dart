import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/favorites_model.dart';
import 'package:flutter_application_2/repositories/favorites_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_controller.g.dart';

@riverpod
class FavoritesController extends _$FavoritesController {
  @override
  bool build() {
    return false;
  }

  Future<void> addFavController(userId, movieId) async {
    try {
      final data = FavoritesModel(movieId: movieId, userId: userId);
      await ref.read(favoritesRepoProvider).addFavorites(favorites: data);
    } catch (e) {
      debugPrint("AddFavController");
      debugPrint(e.toString());
    }
  }
}
