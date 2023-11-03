import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import '../models/patient/patient.dart';
class PatientController  {
  final Dio dio = Dio();

  Future<void> createPatient(Patient newPatient) async {
    DateTime parsedBirthday = DateFormat('dd/MM/yyyy').parse(newPatient.birthday!);
    newPatient.birthday = DateFormat('yyyy-MM-dd').format(parsedBirthday);

    final Map<String, dynamic> patientData = newPatient.toJson();
    const String apiUrl = 'http://localhost:3000/patients';

    try {
      final response = await dio.post(
        apiUrl,
        data: patientData,
      );

      if(response.statusCode == 200) {
        print("Paciente criado.");
      }
    }
    catch(e) {
      print("erro: $e");
    }
  }
}