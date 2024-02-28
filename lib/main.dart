import 'package:flutter_application_2/repositories/auth_repository.dart';
import 'package:flutter_application_2/utils/theme_options.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAuKDpVt1eoDoGgXax7NXi7cq_ezrkyxcs",
              appId: "1:81850071589:android:ff37e6ab8c892d8203ddcc",
              messagingSenderId: "81850071589",
              projectId: "progettoprova-eb74f"))
      : await Firebase.initializeApp();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final userState = ref.watch(authStateChangeProvider);
    // bool isLogin = false;
    // if (userState.value != null){
    //   isLogin = true;
    // }
    print('main');
    return MaterialApp.router(
      theme: ThemeOptions.appTheme,
      routerConfig: goRouter(ref),
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
    );
  }
}
