import 'package:flutter/material.dart';
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

  Future<void> removeFavorites({required movieId, required userId}) async {
    try {
      final document = await firestore
          .collection('favorites')
          .where("movieId", isEqualTo: movieId)
          .where("userId", isEqualTo: userId)
          .get();

      debugPrint('favorites REPO');
      // document.docs.forEach((element) {
      //   print(element.id);
      // });

      final data = document.docs.firstOrNull;
      print(data!.id);

      if (data.id != null) {
        await firestore.collection('favorites').doc(data.id).delete();
      }
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<bool> getFavorites(movieId, userId) async {
    final document = await firestore
        .collection('favorites')
        .where("movieId", isEqualTo: movieId)
        .where("userId", isEqualTo: userId)
        .get();

    final data = document.docs.firstOrNull;
    print("SONO GET FAVORITES REPO");
    print(data);

    if (data == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<List<FavoritesModel>> fetchAllFavorites(userId) async {
    try {
      final data = await firestore
          .collection('favorites')
          .where("userId", isEqualTo: userId)
          .get();

      debugPrint('sono USER ID IN REPO');
      debugPrint(userId.toString());

      debugPrint('sono datadocs in repo');
      debugPrint(data.docs.toString());
      final response = data.docs
          .map(
            (e) => FavoritesModel.fromJson(e.data()),
          )
          .toList();
      final listResponse = response.cast<FavoritesModel>();
      debugPrint('listResponse in repo');
      debugPrint(listResponse.toString());
      return listResponse;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
FavoritesRepo favoritesRepo(FavoritesRepoRef ref) {
  return FavoritesRepo(ref.watch(firestoreProvider));
}

@riverpod
FutureOr<bool> getFavorites(GetFavoritesRef ref, movieId, userId) {
  return ref.watch(favoritesRepoProvider).getFavorites(movieId, userId);
}
