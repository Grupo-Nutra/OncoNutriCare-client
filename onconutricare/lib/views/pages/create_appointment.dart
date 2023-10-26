import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:onconutricare/controllers/appointment.dart';
import 'package:onconutricare/models/appointment/appointment.dart';

import '../widgets/nutri_diagnosis_dropdown.dart';

class CreateAppointment extends StatefulWidget {
  const CreateAppointment({super.key});

  @override
  State<CreateAppointment> createState() => _CreateAppointmentState();
}

class _CreateAppointmentState extends State<CreateAppointment> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController therapeuticPlanController =
      TextEditingController();
  final TextEditingController treatmentController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController crnNController = TextEditingController();

  bool inappetence = false;
  bool nutritionalRisk = false;
  bool tnoStatus = false;

  final MaterialStateProperty<Icon?> _thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nutriDiagnosisDropdownKey = GlobalKey<FormFieldState<String>>();

  _submit() async {
    try {
      // creating appointment obj
      Appointment appointment = Appointment(
          idPatient: int.parse(idController.text),
          weight: double.parse(weightController.text),
          therapeuticPlan: therapeuticPlanController.text,
          tnoStatus: tnoStatus ? 'Sim' : 'Não',
          nutritionalRisk: nutritionalRisk ? 'Sim' : 'Não',
          inappetence: inappetence ? 'Sim' : 'Não',
          treatment: treatmentController.text,
          nutritionalDiagnosis: nutriDiagnosisDropdownKey.currentState?.value,
          fullDate: DateTime.now());

      // creating user on API
      AppointmentController().createAppointment(appointment);

      // login flow successful, navigating to home page
      if (context.mounted) {
        Navigator.pop(context);
      }
    } on Exception catch (e, stackTrace) {
      final log = Logger('ONC_client - create_appointment');
      log.shout('error on submit new appointment', e, stackTrace);
      /* if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ocorreu um erro. Por favor, tente novamente mais tarde. --- $e',
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      } */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'createAppointment',
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Formulário de Consulta'),
          actions: [
            TextButton(
              onPressed: () {
                final formState = formKey.currentState;
                if (formState!.validate()) {
                  _submit();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Os campos obrigatórios não foram preenchidos corretamente.',
                      ),
                    ),
                  );
                }
              },
              child: const Text('Salvar'),
            ),
            SizedBox(width: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.1,
                  horizontal: MediaQuery.of(context).size.width * 0.3),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: idController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'ID',
                        hintText: 'Digite o ID do paciente',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O id é obrigatório.';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'peso',
                        hintText: 'Digite o peso',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O peso é obrigatório.';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: therapeuticPlanController,
                      decoration: const InputDecoration(
                        labelText: 'Plano Terapêutico',
                        hintText: 'Digite o plano terapêutico',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O plano terapêutico é obrigatório.';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: treatmentController,
                      decoration: const InputDecoration(
                        labelText: 'Tratamento',
                        hintText: 'Digite o tratamento',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O tratamento é obrigatório.';
                        }

                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: NutriDiagnosisDropdown(
                              formKey: nutriDiagnosisDropdownKey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Queixa de inapetência?'),
                        Switch(
                          value: inappetence,
                          activeColor: Colors.green,
                          thumbIcon: _thumbIcon,
                          onChanged: (bool value) {
                            setState(() {
                              inappetence = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Risco nutricional?'),
                        Switch(
                          value: nutritionalRisk,
                          activeColor: Colors.green,
                          thumbIcon: _thumbIcon,
                          onChanged: (bool value) {
                            setState(() {
                              nutritionalRisk = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Uso de TNO?'),
                        Switch(
                          value: tnoStatus,
                          activeColor: Colors.green,
                          thumbIcon: _thumbIcon,
                          onChanged: (bool value) {
                            setState(() {
                              tnoStatus = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
