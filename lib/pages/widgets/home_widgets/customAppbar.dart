import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/repositories/user_repository.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  State<CustomAppBar> createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  // Future getUser() {
  //   final user = FirebaseAuth.instance.currentUser!;
  //   final userRepo = UserRepo();
  //   final userData = userRepo.getUser(uid: user.uid);
  //   return userData;
  // }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      // title: FutureBuilder(
      //   future: getUser(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasData) {
      //       return Text("Hi ${snapshot.data["first_name"]}!",
      //           style: Theme.of(context).textTheme.titleLarge);
      //     } else {
      //       return const CircularProgressIndicator();
      //     }
      //   },
      // ),
      actions: [
        // ICON SEARCH
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, size: 40, color: Colors.white),
        ),
      ],
    );
  }
}
