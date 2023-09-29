import 'package:flutter/material.dart';
import 'package:onconutricare/utils/firebase_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
          onPressed: () async {
            await FirebaseHelper().logout();
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: const Text('LOGOUT')),
    );
  }
}
