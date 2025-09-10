import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  Future<void> registerUser() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emailEC.text, password: passwordEC.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuário'),
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
                onPressed: registerUser,
                child: Text('Registrar usuário'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
