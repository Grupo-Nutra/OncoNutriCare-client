import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import '../controllers/patient_service.dart';
import '../main.dart';
import '../models/patient.dart';

part 'patient_store.g.dart';

class PatientsStore = _PatientsStore with _$PatientsStore;

abstract class _PatientsStore with Store {
  final patientService = getIt<PatientService>();

  @observable
  ObservableList<Patient> patients = ObservableList<Patient>();

  @action
  void addPatient(Patient newPatient) {
    patients.add(newPatient);
  }

  @action
  int calculateAge(String? birthday) {
    final birthdayDate = DateFormat('yyyy-MM-dd').parse(birthday!);
    final currentDate = DateTime.now();

    final age = currentDate.year - birthdayDate.year;

    // Verifica se o aniversário deste ano já ocorreu
    if (currentDate.month < birthdayDate.month ||
        (currentDate.month == birthdayDate.month &&
            currentDate.day < birthdayDate.day)) {
      return age - 1;
    } 
  return age;
  }

  @action
  Future<void> createNewPatient(Patient newPatient) async {
    try{
      await patientService.createPatient(newPatient);

      newPatient.age = calculateAge(newPatient.birthday);
    
      addPatient(newPatient);
    } catch (e) {
      throw Exception("Erro ao criar novo paciente: $e");
    }
  }

  @action
  Future<void> loadPatients() async {
    try {
      final List<Patient> loadedPatients = await patientService.fetchPatients();
      patients.clear();
      patients.addAll(loadedPatients);
    } catch (e) {
      throw Exception("Erro ao carregar pacientes: $e");
    }
  }

  @action
  Future<void> removePatient(Patient patient) async {
    try {
      await patientService.deletePatient(patient.id!);

      patients.remove(patient);
    } catch (e) {
      throw Exception("Erro remover paciente: $e");
    }
  }
}

