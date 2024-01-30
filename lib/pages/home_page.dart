import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_application_2/repositories/user_repository.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final user = FirebaseAuth.instance.currentUser!;
final userRepo = UserRepo();
final userData = userRepo.getUser(uid: user.uid);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: userData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text("Signed In as ${snapshot.data.first_name}");
                } else if(snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else{
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
}
