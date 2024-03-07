import 'package:flutter_application_2/models/favorites_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_repository.g.dart';

class FavoritesRepo {
  const FavoritesRepo(this.firestore);
  final FirebaseFirestore firestore;

  //ADD Favorites to firestore
  Future<void> addFavorites({required FavoritesModel favorites}) async {
    try {
      await firestore.collection('favorites').doc().set(favorites.toJson());
    } catch (e) {
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
FavoritesRepo favoritesRepo(FavoritesRepoRef ref) {
  return FavoritesRepo(ref.watch(firestoreProvider));
}
