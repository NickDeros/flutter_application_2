import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/search_controller.dart';
import 'package:flutter_application_2/repositories/movie_repository.dart';
import 'package:flutter_application_2/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});
  static final _formKey = GlobalKey<FormState>();
 

@override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchControllerProvider);
    final myController = TextEditingController();
    final keywordState = ref.watch(saveKeywordProvider);
    print('sono search state');
    print(searchState.hasValue.toString());
    print(searchState);
    return Scaffold(
      appBar: AppBar(title: Text('Search Movies')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            //FORM
            Center(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  onChanged: (value) {
                    // String keyword = myController.text.trim();
                    ref.read(saveKeywordProvider.notifier).state = value;
                    ref
                        .read(searchControllerProvider.notifier)
                        .searchByKeyword(value);
                    print('sono search PRESSED');
                    print(searchState.hasValue.toString());
                  },
                  // controller: myController..text = keywordState,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
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

            searchState.value?.length != null
                ? searchState.value?.length == 0
                    ? Text('No Results')
                    : Center(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.75,
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 10,
                          ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: searchState.value!.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              child: GestureDetector(
                                onTap: () {
                                  final movieId =
                                      searchState.value![index].id.toString();
                                  context.push('/detail_page/$movieId');
                                },
                                child: searchState.value![index].poster_path ==
                                        null
                                    ? Text('image null')
                                    : Image(
                                        image: NetworkImage(imageUrl +
                                            searchState
                                                .value![index].poster_path!),
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.low,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        },
                                      ),
                              ),
                            );
                          },
                        ),
                      )
                : Text(''),
          ]),
        ),
      ),
    );
  }
}
