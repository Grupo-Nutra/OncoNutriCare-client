import 'package:flutter/material.dart';
import '../../main.dart';
import '../../stores/patient_store.dart';

class PatientData extends StatelessWidget {
  final _store = getIt<PatientsStore>();

  PatientData({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPatient = _store.currentPatient!;

    return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1,
            horizontal: MediaQuery.of(context).size.width * 0.3,
          ),
          child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nome', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(currentPatient.name!),
                  const SizedBox(height: 20),
                  const Text('Idade', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(currentPatient.age!.toString()),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Telefone', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(currentPatient.phone!),
                  const SizedBox(height: 20),
                  const Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(currentPatient.email!),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Número do Prontuário', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(currentPatient.medicalRecordNum!),
                  const SizedBox(height: 20),
                  const Text('Diagnóstico Oncológico', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(currentPatient.oncoDiagnosis!),
                ],
              ),
            ),
          ],
        ),
      ),

      );
  }
}