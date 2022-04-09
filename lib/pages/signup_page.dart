import 'package:bhive_assignment/services/route_generator.dart';
import 'package:bhive_assignment/services/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/user_model.dart';

class SignUpPage extends StatelessWidget {
  final String? code;
  SignUpPage({Key? key, this.code}) : super(key: key);

  final TextEditingController referralCodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    referralCodeController.text = code ?? '';

    return Material(
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Welcome !",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 32,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          hintText: "Enter name",
                          label: Text("Name"),
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Enter email",
                          label: Text("Email"),
                        ),
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter password",
                          label: Text("Password"),
                        ),
                      ),
                      TextField(
                        controller: referralCodeController,
                        decoration: const InputDecoration(
                          hintText: "Enter referral code",
                          label: Text("Referral code"),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Material(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            createUser();
                          },
                          child: Container(
                            height: 45,
                            width: 150,
                            alignment: Alignment.center,
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, MyRoutes.loginRoute),
                        child: const Text(
                          'Already a member? Click here to login',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  createUser() async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (newUser != null) {
        final docUser = FirebaseFirestore.instance.collection('users').doc();
        final user = MyUser(
            id: docUser.id,
            email: emailController.text,
            name: nameController.text,
            referralCode: referralCodeController.text);

        final json = user.toJson();

        await docUser.set(json);
        GeneratedRoute.navigateTo(MyRoutes.homeRoute);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      print(e);
    }
  }
}
