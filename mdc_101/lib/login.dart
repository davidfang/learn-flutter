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
              Text(
                'SHRINE',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
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
            alignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  _usernameController.clear();
                  _passwordController.clear();
                },
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.secondary,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)))),
              ),
              ElevatedButton(
                child: const Text('NEXT'),
                onPressed: () => {Navigator.pop(context)},
                style: ElevatedButton.styleFrom(
                    elevation: 8,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)))),
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
