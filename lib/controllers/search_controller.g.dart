// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchControllerHash() => r'7d5d8582a6c34fad7d8def7ac2755810fda80bff';

/// See also [SearchController].
@ProviderFor(SearchController)
final searchControllerProvider = AutoDisposeAsyncNotifierProvider<
    SearchController, List<SearchModel>?>.internal(
  SearchController.new,
  name: r'searchControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchController = AutoDisposeAsyncNotifier<List<SearchModel>?>;
String _$saveKeywordHash() => r'425ddfc35d70a8eb2b3b25ce7b752ab13aae4d02';

/// See also [SaveKeyword].
@ProviderFor(SaveKeyword)
final saveKeywordProvider =
    AutoDisposeNotifierProvider<SaveKeyword, String>.internal(
  SaveKeyword.new,
  name: r'saveKeywordProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$saveKeywordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SaveKeyword = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
