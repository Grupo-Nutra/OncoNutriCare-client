import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../main.dart';
import '../../stores/patient_store.dart';

class PatientsTable extends StatefulWidget {
  const PatientsTable({Key? key}) : super(key: key);

  @override
  PatientsTableState createState() => PatientsTableState();
}

class PatientsTableState extends State<PatientsTable> {
  final _store = getIt<PatientsStore>();

  @override
  void initState() {
    _store.loadPatients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final patients = _store.patients;

        return SizedBox(
          width: double.infinity,
          child: DataTable(
            columns: const [
              DataColumn(label: Row(
                children: [
                  Text('Nome'),
                ],
              )),
              DataColumn(label: Text('Sexo')),
              DataColumn(label: Text('Diagnóstico')),
              DataColumn(label: Text('Idade')),
              DataColumn(label: Text('Excluir')),
              DataColumn(label: Text('Acessar')),
            ],
            rows: patients.asMap().entries.map((entry) {
              final index = entry.key;
              final patientInfo = entry.value;

              return DataRow(
                cells: [
                  DataCell(Text(patientInfo.name.toString())),
                  DataCell(Text(patientInfo.sex.toString())),
                  DataCell(Text(patientInfo.oncoDiagnosis.toString())),
                  DataCell(Text(patientInfo.age.toString())),
                  DataCell(
                    IconButton(
                      icon: const Icon(Icons.delete_outline_outlined, color: Colors.red,), 
                      onPressed: () {
                        final patientToDelete = patients[index]; 
                        _store.removePatient(patientToDelete);
                      },
                    ),
                  ),
                  DataCell(
                    IconButton(
                      icon: const Icon(Icons.arrow_circle_right, color: Colors.green,), 
                      onPressed: () {
                        final currentPatient = patients[index];
                        _store.setCurrentPatient(currentPatient);
                        Navigator.pushNamed(context, '/patient_page');
                      },
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

