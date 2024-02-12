import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options:const  FirebaseOptions(
              apiKey: "AIzaSyAuKDpVt1eoDoGgXax7NXi7cq_ezrkyxcs",
              appId: "1:81850071589:android:ff37e6ab8c892d8203ddcc",
              messagingSenderId: "81850071589",
              projectId: "progettoprova-eb74f"))
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
    );
  }
}
