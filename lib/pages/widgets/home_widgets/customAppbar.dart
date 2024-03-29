import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/repositories/user_repository.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  State<CustomAppBar> createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Text("...", style: TextStyle(color: Colors.white)),
      actions: [
        // ICON SEARCH
        IconButton(
          onPressed: () {
            context.go('/search_page');
          },
          icon: const Icon(Icons.search, size: 40, color: Colors.white),
        ),
      ],
    );
  }
}
