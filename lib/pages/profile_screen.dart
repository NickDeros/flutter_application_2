import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/repositories/user_repository.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future getUser() {
    final user = FirebaseAuth.instance.currentUser!;
    final userRepo = UserRepo();
    final userData = userRepo.getUser(uid: user.uid);
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "Profile Page",
          style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            const CircleAvatar(),
            const SizedBox(height: 10),
            Center(
              child: FutureBuilder(
                future: getUser(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Text("${snapshot.data["first_name"]}",
                        style: Theme.of(context).textTheme.titleMedium);
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            FutureBuilder(
              future: getUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data["email"]}",
                      style: Theme.of(context).textTheme.titleSmall);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            //BUTTONS
            const SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Settings',
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
