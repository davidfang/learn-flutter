import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 80,
          ),
          Column(
            children: [
              Image.asset('assets/diamond.png'),
              const SizedBox(height: 16),
              const Text('SHRINE'),
            ],
          ),
          TextField(
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Username',
            ),
            controller: _usernameController,
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            decoration:
                const InputDecoration(filled: true, labelText: 'Password'),
            obscureText: true,
            controller: _passwordController,
          ),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  _usernameController.clear();
                  _passwordController.clear();
                },
              ),
              ElevatedButton(
                child: const Text('NEXT'),
                onPressed: () => {Navigator.pop(context)},
              )
            ],
          ),
          const SizedBox(
            width: 120,
          ),
        ],
      )),
    );
  }
}
