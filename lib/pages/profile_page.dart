import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/storage_controller.dart';
import 'package:flutter_application_2/controllers/user_controller.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:flutter_application_2/repositories/auth_repository.dart';
import 'package:flutter_application_2/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends ConsumerStatefulWidget {
  ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

String imageUrl = '';

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    bool isEmailChanged = false;
    bool isPasswordChanged = false;
    final formKey = GlobalKey<FormState>();

    final uid = ref.watch(uidProvider).value;

    final userState = ref.watch(userUpdateProvider(uid));
    final userController = ref.watch(userControllerProvider);

    final imageState = ref.watch(imageUploadProvider);

    final TextEditingController emailController =
        TextEditingController(text: userState.value?['email']);
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController ageController =
        TextEditingController(text: userState.value?['age'].toString());

    print(userController.value?.email);

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
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 25),
                Stack(
                  children: [
                    Container(
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
                    Positioned(
                      bottom: 0,
                      left: 75,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 198, 197, 197),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('Edit Image'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        ref
                                            .read(imageUploadProvider.notifier)
                                            .uploadImage(
                                                userState.value, "camera");
                                        context.pop();
                                      },
                                      child: Text('Camera')),
                                  TextButton(
                                      onPressed: () {
                                        ref
                                            .read(imageUploadProvider.notifier)
                                            .uploadImage(
                                                userState.value, "gallery");
                                        context.pop();
                                      },
                                      child: Text('Gallery')),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                userState.hasError
                    ? Text(userState.error.toString())
                    : userState.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          )
                        : Column(
                            children: [
                              Center(
                                child: Text(userState.value?['first_name'] +
                                    ' ' +
                                    userState.value?['last_name']),
                              ),
                              const Row(
                                children: [
                                  Text('Email '),
                                ],
                              ),
                              const SizedBox(height: 25),
                              //TODO: VALIDATORS
                              TextFormField(
                                onChanged: (value) {
                                  isEmailChanged = true;
                                  debugPrint(value);
                                },
                                controller: emailController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: 'example@test.com',
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                ),
                              ),

                              const Row(
                                children: [
                                  Text('Password'),
                                ],
                              ),
                              const SizedBox(height: 14),
                              TextFormField(
                                onChanged: (value) {
                                  isPasswordChanged = true;
                                  debugPrint(value);
                                },
                                controller: passwordController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: '*****',
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
                                controller: ageController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: 'Age',
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                ),
                              ),

                              const SizedBox(height: 40),
                              ElevatedButton(
                                child: userState.isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.red,
                                      )
                                    : const Text('Submit'),
                                onPressed: () {
                                  print('SONO ONPRESSED');
                                  print(ageController.text);

                                  ref
                                      .read(userUpdateProvider(uid).notifier)
                                      .userEdit(
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
                                        int.parse(ageController.text.trim()),
                                        userState.value?['first_name'],
                                        userState.value?['last_name'],
                                        userState.value?['uid'],
                                        isEmailChanged,
                                        isPasswordChanged,
                                      );
                                },
                              ),
                            ],
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
