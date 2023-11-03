import 'package:flutter/material.dart';

import '../widgets/patient_data.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text("Dados do Paciente"),
        centerTitle: true,
      ),
      body: PatientData(),
    );
  }
}

