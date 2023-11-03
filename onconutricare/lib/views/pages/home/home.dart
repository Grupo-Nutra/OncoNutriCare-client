import 'package:flutter/material.dart';
import 'package:onconutricare/utils/firebase_helper.dart';
import 'package:onconutricare/views/pages/home/appointments.dart';
import 'package:onconutricare/views/pages/home/dashboards.dart';
import 'package:onconutricare/views/pages/home/patients.dart';

import '../../../main.dart';
import '../../../models/nutritionist/nutritionist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final Nutritionist nutri = getIt<Nutritionist>();

  late final TabController _tabController;

  bool _isFab1Visible = false;
  bool _isFab2Visible = false;
  bool _isFab3Visible = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _isFab1Visible = true;
    _isFab2Visible = false;
    _isFab3Visible = false;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'Dashboard',
              icon: Icon(Icons.insert_chart_outlined),
            ),
            Tab(
              text: 'Pacientes',
              icon: Icon(Icons.people_alt_outlined),
            ),
            Tab(
              text: 'Consultas',
              icon: Icon(Icons.assignment_outlined),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          DashboardsPage(),
          PatientsPage(),
          AppointmentsPage(),
        ],
      ),
    );
  }

  Widget _buildFab1() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }

  Widget _buildFab2() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.edit),
    );
  }

  Widget _buildFab3() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.delete),
    );
  }

  void _onTabChanged(int index) {
    switch (index) {
      case 0:
        _isFab1Visible = true;
        _isFab2Visible = false;
        _isFab3Visible = false;
        break;
      case 1:
        _isFab1Visible = false;
        _isFab2Visible = true;
        _isFab3Visible = false;
        break;
      case 2:
        _isFab1Visible = false;
        _isFab2Visible = false;
        _isFab3Visible = true;
        break;
    }

    setState(() {});
  }

  Widget _buildFab({required bool isVisible}) {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      // Se o FAB estiver visível, use o tamanho normal.
      // Se o FAB estiver invisível, use o tamanho 0.
      // Isso fará com que o FAB desapareça da tela.
      // size: isVisible ? Size(80, 80) : Size(0, 0),
      child: _buildFabChild(),
    );
  }

  Widget _buildFabChild() {
    return Container(
      width: 80,
      height: 80,
      child: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
