// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userControllerHash() => r'6cb90a18ea300619911b79e582a15c3021b9bbf2';

/// See also [UserController].
@ProviderFor(UserController)
final userControllerProvider =
    AutoDisposeAsyncNotifierProvider<UserController, User?>.internal(
  UserController.new,
  name: r'userControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserController = AutoDisposeAsyncNotifier<User?>;
String _$profileControllerHash() => r'f5f987554bfdb3ded8286c215c4643280ee1dedf';

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

abstract class _$ProfileController
    extends BuildlessAutoDisposeAsyncNotifier<Map<String, dynamic>> {
  late final dynamic uid;

  FutureOr<Map<String, dynamic>> build(
    dynamic uid,
  );
}

/// See also [ProfileController].
@ProviderFor(ProfileController)
const profileControllerProvider = ProfileControllerFamily();

/// See also [ProfileController].
class ProfileControllerFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [ProfileController].
  const ProfileControllerFamily();

  /// See also [ProfileController].
  ProfileControllerProvider call(
    dynamic uid,
  ) {
    return ProfileControllerProvider(
      uid,
    );
  }

  @override
  ProfileControllerProvider getProviderOverride(
    covariant ProfileControllerProvider provider,
  ) {
    return call(
      provider.uid,
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
  String? get name => r'profileControllerProvider';
}

/// See also [ProfileController].
class ProfileControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ProfileController, Map<String, dynamic>> {
  /// See also [ProfileController].
  ProfileControllerProvider(
    dynamic uid,
  ) : this._internal(
          () => ProfileController()..uid = uid,
          from: profileControllerProvider,
          name: r'profileControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$profileControllerHash,
          dependencies: ProfileControllerFamily._dependencies,
          allTransitiveDependencies:
              ProfileControllerFamily._allTransitiveDependencies,
          uid: uid,
        );

  ProfileControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final dynamic uid;

  @override
  FutureOr<Map<String, dynamic>> runNotifierBuild(
    covariant ProfileController notifier,
  ) {
    return notifier.build(
      uid,
    );
  }

  @override
  Override overrideWith(ProfileController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProfileControllerProvider._internal(
        () => create()..uid = uid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProfileController,
      Map<String, dynamic>> createElement() {
    return _ProfileControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileControllerProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProfileControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Map<String, dynamic>> {
  /// The parameter `uid` of this provider.
  dynamic get uid;
}

class _ProfileControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProfileController,
        Map<String, dynamic>> with ProfileControllerRef {
  _ProfileControllerProviderElement(super.provider);

  @override
  dynamic get uid => (origin as ProfileControllerProvider).uid;
}

String _$userUpdateHash() => r'a33b2b83f32ebf329888ba2e0aab793b0621a995';

abstract class _$UserUpdate
    extends BuildlessAutoDisposeAsyncNotifier<Map<String, dynamic>> {
  late final dynamic uid;

  FutureOr<Map<String, dynamic>> build(
    dynamic uid,
  );
}

/// See also [UserUpdate].
@ProviderFor(UserUpdate)
const userUpdateProvider = UserUpdateFamily();

/// See also [UserUpdate].
class UserUpdateFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [UserUpdate].
  const UserUpdateFamily();

  /// See also [UserUpdate].
  UserUpdateProvider call(
    dynamic uid,
  ) {
    return UserUpdateProvider(
      uid,
    );
  }

  @override
  UserUpdateProvider getProviderOverride(
    covariant UserUpdateProvider provider,
  ) {
    return call(
      provider.uid,
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
  String? get name => r'userUpdateProvider';
}

/// See also [UserUpdate].
class UserUpdateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    UserUpdate, Map<String, dynamic>> {
  /// See also [UserUpdate].
  UserUpdateProvider(
    dynamic uid,
  ) : this._internal(
          () => UserUpdate()..uid = uid,
          from: userUpdateProvider,
          name: r'userUpdateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userUpdateHash,
          dependencies: UserUpdateFamily._dependencies,
          allTransitiveDependencies:
              UserUpdateFamily._allTransitiveDependencies,
          uid: uid,
        );

  UserUpdateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final dynamic uid;

  @override
  FutureOr<Map<String, dynamic>> runNotifierBuild(
    covariant UserUpdate notifier,
  ) {
    return notifier.build(
      uid,
    );
  }

  @override
  Override overrideWith(UserUpdate Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserUpdateProvider._internal(
        () => create()..uid = uid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserUpdate, Map<String, dynamic>>
      createElement() {
    return _UserUpdateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserUpdateProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserUpdateRef
    on AutoDisposeAsyncNotifierProviderRef<Map<String, dynamic>> {
  /// The parameter `uid` of this provider.
  dynamic get uid;
}

class _UserUpdateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserUpdate,
        Map<String, dynamic>> with UserUpdateRef {
  _UserUpdateProviderElement(super.provider);

  @override
  dynamic get uid => (origin as UserUpdateProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
