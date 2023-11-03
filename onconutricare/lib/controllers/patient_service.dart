import 'package:dio/dio.dart';
import '../main.dart';
import '../models/nutritionist/nutritionist.dart';
import '../models/patient.dart';


class PatientService  {
  final Dio dio = Dio();
  final Nutritionist nutri = getIt<Nutritionist>();

  Future<void> createPatient(Patient newPatient) async {

    final Map<String, dynamic> patientData = newPatient.toJson();
    const String apiUrl = 'http://localhost:3000/patients';

    try {
      await dio.post(
        apiUrl,
        data: patientData,
      );
    }
    catch(e) {
      throw Exception("Erro ao criar novo paciente.");
    }
  }

  Future<List<Patient>> fetchPatients() async {
    final String apiUrl = 'http://localhost:3000/patients/nutritionist/${nutri.uuid}';

    try {
      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> patientsData = response.data;
        final List<Patient> patients = patientsData
            .map((data) => Patient.fromJson(data))
            .toList();

        return patients;
      } else {
        throw Exception("Erro ao buscar pacientes.");
      }
    } catch (e) {
      throw Exception("Erro ao buscar pacientes: $e");
    }
  }

Future<void> updatePatient(Patient editedPatient) async {
    final Map<String, dynamic> patientData = editedPatient.toJson();
    final String apiUrl = 'http://localhost:3000/patients/${editedPatient.id}';

    try {
      await dio.put(
        apiUrl,
        data: patientData,
      );
    }
    catch(e) {
      throw Exception("Erro ao atualizar paciente.");
    }
  }

  Future<void> deletePatient(int patientId) async {
    final String apiUrl = 'http://localhost:3000/patients/$patientId';

    try {
      await dio.delete(
        apiUrl
      );
    }
    catch(e) {
      throw Exception("Erro ao criar novo paciente.");
    }
  }
}

