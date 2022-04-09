import 'package:bhive_assignment/services/route_generator.dart';
import 'package:bhive_assignment/services/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
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
                      const SizedBox(height: 40),
                      Material(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () async {
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);
                              if (user != null) {
                                GeneratedRoute.navigateTo(MyRoutes.homeRoute);
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Container(
                            height: 45,
                            width: 150,
                            alignment: Alignment.center,
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
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
}
