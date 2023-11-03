import 'package:flutter/material.dart';

import '../../utils/firebase_helper.dart';
import '../../main.dart';
import '../../models/nutritionist/nutritionist.dart';
import '../widgets/patients_table.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final Nutritionist nutri = getIt<Nutritionist>();

  @override
  void initState() {
    super.initState();
  }

  _logout(BuildContext context) async {
    await FirebaseHelper().logout();
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Onco Nutri Care"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Minha Conta"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Configurações"),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text("Sair"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
            } else if (value == 1) {
            } else if (value == 2) {
              _logout(context);
            }
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/register_patient');
        },
      ),
      body: const SingleChildScrollView(
        child: PatientsTable(),
      ),
    );
  }
}
