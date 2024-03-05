import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/search_controller.dart';
import 'package:flutter_application_2/repositories/movie_repository.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchControllerProvider);
    final _formKey = GlobalKey<FormState>();
    final myController = TextEditingController();
    print('sono search state');
    print(searchState.hasValue.toString());
    print(searchState);
    return Scaffold(
      appBar: AppBar(title: Text('test')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Center(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: myController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                String keyword = myController.text.trim();
                ref
                    .read(searchControllerProvider.notifier)
                    .searchByKeyword(keyword);
                print('sono search PRESSED');
                print(searchState.hasValue.toString());
              },
              child: searchState.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Search'),
            ),
            searchState.value?.length != null
                ? searchState.value?.length == 0
                    ? Text('No Results')
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: searchState.value!.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    final movieId =
                                        searchState.value![index].id.toString();
                                    context.go('/detail_page/$movieId');
                                  },
                                  child:
                                      searchState.value![index].poster_path ==
                                              null
                                          ? Text('image null')
                                          : Image(
                                              image: NetworkImage(imageUrl +
                                                  searchState.value![index].poster_path!),
                                              fit: BoxFit.fill,
                                              filterQuality: FilterQuality.low,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              },
                                            ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                ),
                              ],
                            ),
                          );
                          // Row(
                          //   children: [
                          //     Icon(Icons.movie_creation_rounded),
                          //     Text(
                          //       searchState.value![index]['original_title'],
                          //       style: TextStyle(color: Colors.white),
                          //     )
                          //   ],
                          // );
                        },
                      )
                : Text(''),
          ]),
        ),
      ),
    );
  }
}
