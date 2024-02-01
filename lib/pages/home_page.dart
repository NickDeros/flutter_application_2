import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_application_2/repositories/user_repository.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String firstName = "...";
  Future getUser() {
    final user = FirebaseAuth.instance.currentUser!;
    final userRepo = UserRepo();
    final userData = userRepo.getUser(uid: user.uid);
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(firstName),
            FutureBuilder(
              future: getUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print("hasdata");
                  print(snapshot.data["first_name"]);
                  return Text("Signed In as ${snapshot.data["first_name"]}");
                } else if (snapshot.hasError) {
                  print("haserror");
                  return Text(snapshot.error.toString());
                } else {
                  print("Loading");
                  return CircularProgressIndicator();
                }
              },
            ),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.deepPurple[200],
              child: const Text('sign out'),
            ),
          ],
        ),
      ),
    );
  }

  // void setName(userData) {
  //   setState(() {
  //     firstName = userData.first_name;
  //   });
  // }
}
