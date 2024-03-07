import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/auth_controller.dart';
import 'package:flutter_application_2/repositories/user_repository.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  // Future getUser() {
  //   final user = FirebaseAuth.instance.currentUser!;
  //   final userRepo = UserRepo();
  //   final userData = userRepo.getUser(uid: user.uid);
  //   return userData;
  // }

  @override
  Widget build(BuildContext context) {
    final auth = AuthController();
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 0, 23, 31),
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('name'),
            accountEmail: Text('email'),
            // accountName: FutureBuilder(
            //   future: getUser(),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if (snapshot.hasData) {
            //       return Padding(
            //         padding: const EdgeInsets.only(top: 20.0),
            //         child: Text(
            //             "${snapshot.data["first_name"]} ${snapshot.data["last_name"]}!",
            //             style: Theme.of(context).textTheme.titleSmall),
            //       );
            //     } else {
            //       return const CircularProgressIndicator();
            //     }
            //   },
            // ),
            // accountEmail: FutureBuilder(
            //   future: getUser(),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if (snapshot.hasData) {
            //       return Text("${snapshot.data["email"]}!",
            //           style: Theme.of(context).textTheme.titleSmall);
            //     } else {
            //       return const CircularProgressIndicator();
            //     }
            //   },
            // ),
            // currentAccountPicture: const CircleAvatar(
            //   backgroundImage: NetworkImage(''),
            // ),
            currentAccountPicture: Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 23, 31),
            ),
          ),
          // PROFILE
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onTap: () {
              context.go('/profile_page');
            },
          ),
            //FAVORITES
          ListTile(
            leading: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            title: Text(
              "Favorites",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onTap: () {
              context.go('/favorites_page');
            },
          ),
            // LOGOUT
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: Text(
              "Logout",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Are you sure to log out?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Confirm'),
                        onPressed: () {
                          auth.logOut();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
