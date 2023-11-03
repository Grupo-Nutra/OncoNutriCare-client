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

  @observable
  Patient? currentPatient;

  @action
  void addPatient(Patient patient) {
    patient.age = calculateAge(patient.birthday);
    patients.add(patient);
  }

  int calculateAge(String? birthday) {
    final birthdayDate = DateTime.parse(birthday!);
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
    DateTime parsedBirthday = DateFormat('dd/MM/yyyy').parse(newPatient.birthday!);
    newPatient.birthday = DateFormat('yyyy-MM-dd').format(parsedBirthday);
    try{
      await patientService.createPatient(newPatient); 
      addPatient(newPatient);
    } catch (e) {
      throw Exception("Erro ao criar novo paciente: $e");
    }
  }

  @action
  Future<void> loadPatients() async {
    try {
      final List<Patient> loadedPatients = await patientService.fetchPatients();
      
      for(final patient in loadedPatients) {
        patient.age = calculateAge(patient.birthday);
      }
      
      patients.clear();
      patients.addAll(loadedPatients);
    } catch (e) {
      throw Exception("Erro ao carregar pacientes: $e");
    }
  }

  @action
  Future<void> saveEditedPatient(Patient editedPatient) async {
    DateTime parsedBirthday = DateFormat('dd/MM/yyyy').parse(editedPatient.birthday!);
    editedPatient.birthday = DateFormat('yyyy-MM-dd').format(parsedBirthday);
    try {
      await patientService.updatePatient(editedPatient);

      final index = patients.indexWhere((patient) => patient.id == editedPatient.id);

      if (index != -1) {
        patients.removeAt(index);
        patients.add(editedPatient);
      }
    } catch (e) {
      throw Exception("Erro ao editar o paciente: $e");
    }
  }

  @action
  void setCurrentPatient(Patient patient) {
    currentPatient = patient;
  }

  @action
  Future<void> removePatient(Patient patient) async {
    try {
      await patientService.deletePatient(patient.id!);

      final index = patients.indexWhere((patient) => patient.id == patient.id);

      if (index != -1) {
        patients.removeAt(index);
      }
    } catch (e) {
      throw Exception("Erro ao remover paciente: $e");
    }
  }
}

