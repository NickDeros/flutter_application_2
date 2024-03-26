import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/auth_controller.dart';
import 'package:flutter_application_2/controllers/user_controller.dart';
import 'package:flutter_application_2/repositories/auth_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends ConsumerStatefulWidget {
  const MyDrawer({super.key});

  @override
  ConsumerState<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends ConsumerState<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final uid = ref.watch(uidProvider).value;
    final userState = ref.watch(userUpdateProvider(uid));
    final userController = ref.watch(userControllerProvider);
    final auth = AuthController();
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 0, 23, 31),
      child: userState.hasError
          ? Text('ERROR')
          : userState.isLoading
              ? Container()
              : ListView(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text(userState.value!['first_name']),
                      accountEmail:
                          Text(userController.value!.email.toString()),
                      currentAccountPicture: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: userState.value?['imgUrl'] == null
                            ? const Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 50,
                              )
                            : CircleAvatar(
                                backgroundImage: NetworkImage(
                                  '${userState.value!['imgUrl']}',
                                ),
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
                    //PLANS
                    ListTile(
                      leading: const Icon(
                        Icons.monetization_on_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Premium Plans",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      onTap: () {
                        context.go('/plans_page');
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
