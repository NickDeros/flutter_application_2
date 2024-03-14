import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/favorites_controller.dart';
import 'package:flutter_application_2/repositories/auth_repository.dart';
import 'package:flutter_application_2/repositories/favorites_repository.dart';
import 'package:flutter_application_2/repositories/movie_repository.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(uidProvider).value;
    final AsyncValue movieList = ref.watch(
      userFavoritesProvider(id!),
    );
    debugPrint(id.toString());
    debugPrint(movieList.toString());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: movieList.isLoading
            ? CircularProgressIndicator()
            : movieList.hasError
                ? Text(movieList.asError.toString())
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.75,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 10,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: movieList.value!.length,
                    itemBuilder: (context, index) {
                      debugPrint(
                          'movieList.value![index].poster_path.toString()');
                      debugPrint(
                          movieList.value![index]['poster_path'].toString());
                      return ClipRRect(
                        child: GestureDetector(
                          onTap: () {
                            final movieId =
                                movieList.value![index]['id'].toString();
                            context.push('/detail_page/$movieId');
                          },
                          child: movieList.value![index]['poster_path'] == null
                              ? Text('image null')
                              : Image(
                                  image: NetworkImage(imageUrl +
                                      movieList.value![index]['poster_path']!),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  },
                                ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
