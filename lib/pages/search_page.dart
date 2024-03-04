import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/search_controller.dart';
import 'package:flutter_application_2/repositories/movie_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('REFWATCH');
    List<Map<String, dynamic>> list = [
      {"id": 262419, "name": "lost"},
      {"id": 5930, "name": "getting" "lost"},
    ];
    final searchState = ref.watch(searchControllerProvider);
    final _formKey = GlobalKey<FormState>();
    final myController = TextEditingController();
    print('sono search state');
    print(searchState.hasValue.toString());
    print(searchState);
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
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
                          return Row(
                            children: [
                              Icon(Icons.movie_creation_rounded),
                              Text(
                                searchState.value![index].name,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          );
                        },
                      )
                : Text(''),
          ]),
        ),
      ),
    );
  }
}
