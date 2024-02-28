import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/user_controller.dart';
import 'package:flutter_application_2/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends ConsumerWidget {
  ProfilePage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userController = ref.watch(userControllerProvider);
    final userData =
        ref.watch(ProfileControllerProvider('OmDD38EIGyPC0M4e9GLAt6ht8n62'));
    print('PROFILE');
    print(userData.value?['first_name']);
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "Profile Page",
          style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 25),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 10),
                userData.isLoading
                    ? const CircularProgressIndicator()
                    : Center(
                        child: Text(userData.value?['first_name'] +' ' + userData.value?['last_name']),
                        // child: FutureBuilder(
                        //   future: getUser(),
                        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                        //     if (snapshot.hasData) {
                        //       return Text("${snapshot.data["first_name"]}",
                        //           style: Theme.of(context).textTheme.titleMedium);
                        //     } else {
                        //       return const CircularProgressIndicator();
                        //     }
                        //   },
                        // ),
                      ),
                //BUTTONS
                const SizedBox(height: 25),

                //FORMS

                //EMAIL

                const Row(
                  children: [
                    Text('Email '),
                  ],
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: userData.value?['email'],
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'example@test.com',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
                const SizedBox(height: 14),

                //PASSWORD
                const Row(
                  children: [
                    Text('Password'),
                  ],
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: '***',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
                const SizedBox(height: 14),

                //AGE
                const Row(
                  children: [
                    Text('Age'),
                  ],
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Age',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 90),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  label: Text(
                    'Confirm',
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                    ),
                  ),
                  icon: const Icon(Icons.save),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
