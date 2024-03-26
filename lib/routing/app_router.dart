import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/favorites_page.dart';
import 'package:flutter_application_2/pages/forgot_password_page.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/movie_detail_page.dart';
import 'package:flutter_application_2/pages/plans_page.dart';
import 'package:flutter_application_2/pages/profile_page.dart';
import 'package:flutter_application_2/pages/register_page.dart';
import 'package:flutter_application_2/pages/search_page.dart';
import 'package:flutter_application_2/repositories/auth_repository.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter(ref) {
  final userState = ref.watch(authStateChangeProvider);

  bool isLogin = false;
  if (userState.value != null) {
    isLogin = true;
  }
  final goRouter = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
        redirect: (context, state) {
          if (!isLogin) {
            return '/login_page';
          }
          return null;
        },
        routes: [
          GoRoute(
              path: 'plans_page',
              name: 'plans_page',
              builder: (context, state) {
                return const PlansPage();
              }),
          GoRoute(
              path: 'favorites_page',
              name: 'favorites_page',
              builder: (context, state) {
                return const FavoritesPage();
              }),
          GoRoute(
              path: 'search_page',
              name: 'search_page',
              builder: (context, state) {
                return const SearchPage();
              }),
          GoRoute(
              path: 'profile_page',
              name: 'profile_page',
              builder: (context, state) {
                return ProfilePage();
              }),
          GoRoute(
            path: 'detail_page/:movieId',
            name: 'detail_page',
            pageBuilder: (context, state) {
              //transition
              return CustomTransitionPage(
                transitionDuration: const Duration(milliseconds: 25),
                key: state.pageKey,
                child: MovieDetailPage(
                    movieId: int.parse(state.pathParameters['movieId']!)),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
              );
            },
          ),
        ],
      ),
      GoRoute(
          path: '/login_page',
          name: 'login_page',
          builder: (context, state) {
            return const LoginPage();
          }),
      GoRoute(
          path: '/register_page',
          name: 'register_page',
          builder: (context, state) {
            return const RegisterPage();
          }),
      GoRoute(
          path: '/forgot_password_page',
          name: 'forgot_password_page',
          builder: (context, state) {
            return const ForgotPasswordPage();
          }),
    ],
  );

  return goRouter;
}
