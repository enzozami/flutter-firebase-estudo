import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailEC.text, password: passwordEC.text);

    final user = credential.user;

    if (user != null && !user.emailVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('E-mail não verificado!'),
        ),
      );
    }

    log('${credential.user?.email}');
    log('${credential.user?.emailVerified}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login de Usuário'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: emailEC,
                decoration: InputDecoration(
                  label: Text('E-mail'),
                ),
              ),
              TextField(
                controller: passwordEC,
                decoration: InputDecoration(
                  label: Text('Password'),
                ),
              ),
              ElevatedButton(
                onPressed: loginUser,
                child: Text('Login usuário'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
