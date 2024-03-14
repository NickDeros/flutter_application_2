import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/favorites_model.dart';
import 'package:flutter_application_2/repositories/favorites_repository.dart';
import 'package:flutter_application_2/repositories/movie_repository.dart';
import 'package:riverpod/src/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_controller.g.dart';

@riverpod
class FavoritesController extends _$FavoritesController {
  @override
  FutureOr<bool> build(movieId, userId) async {
    final favoritesRepo = await ref.read(favoritesRepoProvider);
    final data = favoritesRepo.getFavorites(movieId, userId);
    return data;
  }

  Future<void> addFavController(userId, movieId) async {
    state = AsyncLoading();
    try {
      final data = FavoritesModel(movieId: movieId, userId: userId);
      await ref.read(favoritesRepoProvider).addFavorites(favorites: data);
      state = AsyncData(true);
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
      debugPrint("AddFavController");
      debugPrint(e.toString());
    }
  }

  Future<void> removeFavController(userId, movieId) async {
    state = AsyncLoading();
    try {
      await ref
          .read(favoritesRepoProvider)
          .removeFavorites(movieId: movieId, userId: userId);
      state = AsyncData(false);
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
      debugPrint("AddFavController");
      debugPrint(e.toString());
    }
  }
}

@riverpod
Future userFavorites(UserFavoritesRef ref, String userId) async {
  //lista di movies
  List movielist = [];
  //elenco favorites movie
  final favorites =
      await ref.watch(favoritesRepoProvider).fetchAllFavorites(userId);

  debugPrint('sono USER ID IN CONTROLLER');
  debugPrint(userId.toString());

  debugPrint('sono favorites');
  debugPrint(favorites.toString());
  for (var favorite in favorites) {
    final movie = await ref.watch(movieRepoProvider).getMovie(favorite.movieId);
    movielist.add(movie);

    debugPrint('sono movielist ciclo FOR');
    debugPrint(movielist.toString());
  }
  debugPrint('sono movielist userFavorites');
  debugPrint(movielist.toString());
  //elenco film
  //usare getmovie con movieid

  return movielist;
}
