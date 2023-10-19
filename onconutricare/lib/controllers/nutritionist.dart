import 'package:dio/dio.dart';
import 'package:onconutricare/config/constants.dart';
import '../models/nutritionist/nutritionist.dart';

class NutritionistController {
  final Dio dio = Dio();

  Future<void> createNutritionist(Nutritionist nutritionist) async {
    final Map<String, dynamic> nutritionistData = nutritionist.toJson();
    const String apiUrl = '$apiUrlBase/nutritionists';

    try {
      final response = await dio.post(
        apiUrl,
        data: nutritionistData,
      );
    } catch (e) {
      print("erro: $e");
    }
  }

  Future<Nutritionist?> getNutritionist(String uuid) async {
    String apiUrl = '$apiUrlBase/nutritionists/$uuid';

    try {
      final response = await dio.get(
        apiUrl,
      );
      return Nutritionist.fromJson(response.data["nutritionist"]);
    } catch (e) {
      print("erro: $e");
      return null;
    }
  }

  Future<void> updateNutritionist(Nutritionist nutritionist) async {
    final Map<String, dynamic> nutritionistData = nutritionist.toJson();
    String apiUrl = '$apiUrlBase/nutritionists/${nutritionist.uuid}';

    try {
      final response = await dio.put(
        apiUrl,
        data: nutritionistData,
      );
    } catch (e) {
      print("erro: $e");
    }
  }

  Future<void> deleteNutritionist(String uuid) async {
    String apiUrl = '$apiUrlBase/nutritionists/$uuid';

    try {
      final response = await dio.delete(
        apiUrl,
      );
    } catch (e) {
      print("erro: $e");
    }
  }
}
