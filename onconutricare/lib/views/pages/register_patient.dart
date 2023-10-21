import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../controllers/patient_controller.dart';
import '../../models/patient/patient.dart';
import '../../main.dart';
import '../../models/nutritionist/nutritionist.dart';
import '../widgets/sex_dropdown.dart';

class RegisterPatient extends StatefulWidget {
  const RegisterPatient({super.key});

  @override
  State<RegisterPatient> createState() => _RegisterPatientState();
}

class _RegisterPatientState extends State<RegisterPatient> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _medicalRecordNumController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _oncoDiagnosisController = TextEditingController();
  final _patientController = PatientController();
  final _sexDropdownKey = GlobalKey<FormFieldState<String>>();
  final Nutritionist user = getIt<Nutritionist>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Paciente'), centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.1,
                horizontal: MediaQuery.of(context).size.width * 0.3),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                      ),
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'Campo obrigatório.';
                        } 
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _birthdayController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Data de Nascimento',
                        prefixIcon: Icon(Icons.date_range),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context, 
                          initialDate: DateTime.now(), 
                          firstDate:  DateTime(1920), 
                          lastDate: DateTime.now());
                          if(pickedDate != null) {
                            setState(() {
                            _birthdayController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                            });
                          }
                      },
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'Campo obrigatório.';
                        } 
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _medicalRecordNumController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Número do Prontuário',
                      ),
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'Campo obrigatório.';
                        } 
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    SexDropdown(
                      formKey: _sexDropdownKey,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Telefone',
                      ),
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'Campo obrigatório.';
                        } 
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'Campo obrigatório.';
                        } 
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _oncoDiagnosisController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Diagnóstico Oncológico',
                      ),
                      validator: (value) {
                        if(value!.isEmpty) {
                          return 'Campo obrigatório.';
                        } 
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final newPatient = Patient(
                        name: _nameController.text,
                        birthday: _birthdayController.text,
                        medicalRecordNum: _medicalRecordNumController.text,
                        sex: _sexDropdownKey.currentState?.value,
                        phone: _phoneController.text,
                        email: _emailController.text,
                        oncoDiagnosis: _oncoDiagnosisController.text,
                        nutriId: user.uuid,
                      );
                      await _patientController.createPatient(newPatient).then((value) => Navigator.pop(context));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,),
                  child: const Text('CADASTRAR', style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        )
      ),
      
    );
  }
}