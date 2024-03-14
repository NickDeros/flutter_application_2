// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userFavoritesHash() => r'558985a633a1111e220817a4d78c7ee4faabe155';

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

/// See also [userFavorites].
@ProviderFor(userFavorites)
const userFavoritesProvider = UserFavoritesFamily();

/// See also [userFavorites].
class UserFavoritesFamily extends Family<AsyncValue> {
  /// See also [userFavorites].
  const UserFavoritesFamily();

  /// See also [userFavorites].
  UserFavoritesProvider call(
    String userId,
  ) {
    return UserFavoritesProvider(
      userId,
    );
  }

  @override
  UserFavoritesProvider getProviderOverride(
    covariant UserFavoritesProvider provider,
  ) {
    return call(
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
  String? get name => r'userFavoritesProvider';
}

/// See also [userFavorites].
class UserFavoritesProvider extends AutoDisposeFutureProvider<Object?> {
  /// See also [userFavorites].
  UserFavoritesProvider(
    String userId,
  ) : this._internal(
          (ref) => userFavorites(
            ref as UserFavoritesRef,
            userId,
          ),
          from: userFavoritesProvider,
          name: r'userFavoritesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userFavoritesHash,
          dependencies: UserFavoritesFamily._dependencies,
          allTransitiveDependencies:
              UserFavoritesFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserFavoritesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<Object?> Function(UserFavoritesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserFavoritesProvider._internal(
        (ref) => create(ref as UserFavoritesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Object?> createElement() {
    return _UserFavoritesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserFavoritesProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserFavoritesRef on AutoDisposeFutureProviderRef<Object?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserFavoritesProviderElement
    extends AutoDisposeFutureProviderElement<Object?> with UserFavoritesRef {
  _UserFavoritesProviderElement(super.provider);

  @override
  String get userId => (origin as UserFavoritesProvider).userId;
}

String _$favoritesControllerHash() =>
    r'ed4c6e2e6ee7413b5a52a9e1b5771b834a312c57';

abstract class _$FavoritesController
    extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final dynamic movieId;
  late final dynamic userId;

  FutureOr<bool> build(
    dynamic movieId,
    dynamic userId,
  );
}

/// See also [FavoritesController].
@ProviderFor(FavoritesController)
const favoritesControllerProvider = FavoritesControllerFamily();

/// See also [FavoritesController].
class FavoritesControllerFamily extends Family<AsyncValue<bool>> {
  /// See also [FavoritesController].
  const FavoritesControllerFamily();

  /// See also [FavoritesController].
  FavoritesControllerProvider call(
    dynamic movieId,
    dynamic userId,
  ) {
    return FavoritesControllerProvider(
      movieId,
      userId,
    );
  }

  @override
  FavoritesControllerProvider getProviderOverride(
    covariant FavoritesControllerProvider provider,
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
  String? get name => r'favoritesControllerProvider';
}

/// See also [FavoritesController].
class FavoritesControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FavoritesController, bool> {
  /// See also [FavoritesController].
  FavoritesControllerProvider(
    dynamic movieId,
    dynamic userId,
  ) : this._internal(
          () => FavoritesController()
            ..movieId = movieId
            ..userId = userId,
          from: favoritesControllerProvider,
          name: r'favoritesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$favoritesControllerHash,
          dependencies: FavoritesControllerFamily._dependencies,
          allTransitiveDependencies:
              FavoritesControllerFamily._allTransitiveDependencies,
          movieId: movieId,
          userId: userId,
        );

  FavoritesControllerProvider._internal(
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
  FutureOr<bool> runNotifierBuild(
    covariant FavoritesController notifier,
  ) {
    return notifier.build(
      movieId,
      userId,
    );
  }

  @override
  Override overrideWith(FavoritesController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FavoritesControllerProvider._internal(
        () => create()
          ..movieId = movieId
          ..userId = userId,
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
  AutoDisposeAsyncNotifierProviderElement<FavoritesController, bool>
      createElement() {
    return _FavoritesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoritesControllerProvider &&
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

mixin FavoritesControllerRef on AutoDisposeAsyncNotifierProviderRef<bool> {
  /// The parameter `movieId` of this provider.
  dynamic get movieId;

  /// The parameter `userId` of this provider.
  dynamic get userId;
}

class _FavoritesControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FavoritesController, bool>
    with FavoritesControllerRef {
  _FavoritesControllerProviderElement(super.provider);

  @override
  dynamic get movieId => (origin as FavoritesControllerProvider).movieId;
  @override
  dynamic get userId => (origin as FavoritesControllerProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
