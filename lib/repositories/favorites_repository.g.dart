// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoritesRepoHash() => r'304b88fb946dc8857ac200fc78c8ec80141eed39';

/// See also [favoritesRepo].
@ProviderFor(favoritesRepo)
final favoritesRepoProvider = Provider<FavoritesRepo>.internal(
  favoritesRepo,
  name: r'favoritesRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoritesRepoRef = ProviderRef<FavoritesRepo>;
String _$getFavoritesHash() => r'f409d0ddf35f8a783078c3844b0d1f23d917972d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getFavorites].
@ProviderFor(getFavorites)
const getFavoritesProvider = GetFavoritesFamily();

/// See also [getFavorites].
class GetFavoritesFamily extends Family<AsyncValue<bool>> {
  /// See also [getFavorites].
  const GetFavoritesFamily();

  /// See also [getFavorites].
  GetFavoritesProvider call(
    dynamic movieId,
    dynamic userId,
  ) {
    return GetFavoritesProvider(
      movieId,
      userId,
    );
  }

  @override
  GetFavoritesProvider getProviderOverride(
    covariant GetFavoritesProvider provider,
  ) {
    return call(
      provider.movieId,
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getFavoritesProvider';
}

/// See also [getFavorites].
class GetFavoritesProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [getFavorites].
  GetFavoritesProvider(
    dynamic movieId,
    dynamic userId,
  ) : this._internal(
          (ref) => getFavorites(
            ref as GetFavoritesRef,
            movieId,
            userId,
          ),
          from: getFavoritesProvider,
          name: r'getFavoritesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getFavoritesHash,
          dependencies: GetFavoritesFamily._dependencies,
          allTransitiveDependencies:
              GetFavoritesFamily._allTransitiveDependencies,
          movieId: movieId,
          userId: userId,
        );

  GetFavoritesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
    required this.userId,
  }) : super.internal();

  final dynamic movieId;
  final dynamic userId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(GetFavoritesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetFavoritesProvider._internal(
        (ref) => create(ref as GetFavoritesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _GetFavoritesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetFavoritesProvider &&
        other.movieId == movieId &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetFavoritesRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `movieId` of this provider.
  dynamic get movieId;

  /// The parameter `userId` of this provider.
  dynamic get userId;
}

class _GetFavoritesProviderElement
    extends AutoDisposeFutureProviderElement<bool> with GetFavoritesRef {
  _GetFavoritesProviderElement(super.provider);

  @override
  dynamic get movieId => (origin as GetFavoritesProvider).movieId;
  @override
  dynamic get userId => (origin as GetFavoritesProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
