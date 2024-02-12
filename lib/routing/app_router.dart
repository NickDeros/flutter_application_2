import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/movie_detail_page.dart';
import 'package:flutter_application_2/pages/register_page.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/login_page',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'detail_page/:movieId',
          name: 'detail_page',
          builder: ((context, state) {
            return MovieDetailPage(movieId: int.parse(state.pathParameters['movieId']!));
          }),
        ),
      ],
    ),
    GoRoute(
        path: '/login_page',
        name: 'login_page',
        builder: (context, state) {
          return LoginPage();
        }),
    GoRoute(
        path: '/register_page',
        name: 'register_page',
        builder: (context, state) {
          return RegisterPage();
        }),
  ],
);
