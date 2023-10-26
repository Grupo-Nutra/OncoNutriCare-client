import 'package:dio/dio.dart';
import 'dart:convert';

import '../config/constants.dart';
import '../models/appointment/appointment.dart';

class AppointmentController {
  final Dio dio = Dio();

  Future<void> createAppointment(Appointment appointment) async {
    final Map<String, dynamic> appointmentData = appointment.toJson();
    const String apiUrl = '$apiUrlBase/appointments';

    try {
      final response = await dio.post(
        apiUrl,
        data: appointmentData,
      );
    } catch (e) {
      print("erro: $e");
    }
  }

  Future<Appointment?> getAppointment(String id) async {
    String apiUrl = '$apiUrlBase/appointments/$id';

    try {
      final response = await dio.get(
        apiUrl,
      );
      return Appointment.fromJson(response.data["appointment"]);
    } catch (e) {
      print("erro: $e");
      return null;
    }
  }

  Future<List<Appointment?>?> getAppointmentsByPatient(String patientId) async {
    String apiUrl = '$apiUrlBase/appointments/patients/$patientId';
    List<Appointment> appointments = [];

    try {
      final response = await dio.get(
        apiUrl,
      );
      List<dynamic> appointmentsRaw = json.decode(response.data);
      appointments = appointmentsRaw
          .map((appointment) => Appointment.fromJson(appointment))
          .toList();
      return appointments;
    } catch (e) {
      print("erro: $e");
      return null;
    }
  }

  Future<void> updateAppointment(Appointment appointment) async {
    final Map<String, dynamic> appointmentData = appointment.toJson();
    String apiUrl = '$apiUrlBase/appointments/${appointment.id}';

    try {
      final response = await dio.put(
        apiUrl,
        data: appointmentData,
      );
    } catch (e) {
      print("erro: $e");
    }
  }

  Future<void> deleteAppointment(String id) async {
    String apiUrl = '$apiUrlBase/appointments/$id';

    try {
      final response = await dio.delete(
        apiUrl,
      );
    } catch (e) {
      print("erro: $e");
    }
  }
}
