import 'package:dio/dio.dart';

import '../config/constants.dart';
import '../main.dart';
import '../models/nutritionist/nutritionist.dart';

class NutritionistController {
  final Dio dio = Dio();

  Future<Response> createNutritionist(Nutritionist nutritionist) async {
    final Map<String, dynamic> nutritionistData = nutritionist.toJson();
    const String apiUrl = '$apiUrlBase/nutritionists';

    try {
      final response = await dio.post(
        apiUrl,
        data: nutritionistData,
      );
      return response;
    } catch (e) {
      // Registrar a exceção usando um logger
      log.severe('Erro ao criar nutricionista:', e);

      // Retornar uma resposta de erro adequada ao cliente
      throw DioException(
        requestOptions: RequestOptions(path: apiUrl),
        type: DioExceptionType.connectionError,
        response: Response(
          requestOptions: RequestOptions(path: apiUrl),
          statusCode: 500,
          statusMessage: 'Erro ao criar nutricionista.',
        ),
      );
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
      // Registrar a exceção usando um logger
      log.severe('Erro ao buscar nutricionista:', e);

      // Retornar uma resposta de erro adequada ao cliente
      throw DioException(
        requestOptions: RequestOptions(path: apiUrl),
        type: DioExceptionType.connectionError,
        response: Response(
          requestOptions: RequestOptions(path: apiUrl),
          statusCode: 500,
          statusMessage: 'Erro ao buscar nutricionista.',
        ),
      );
    }
  }

  Future<Response> updateNutritionist(Nutritionist nutritionist) async {
    final Map<String, dynamic> nutritionistData = nutritionist.toJson();
    String apiUrl = '$apiUrlBase/nutritionists/${nutritionist.uuid}';

    try {
      final response = await dio.put(
        apiUrl,
        data: nutritionistData,
      );
      return response;
    } catch (e) {
      // Registrar a exceção usando um logger
      log.severe('Erro ao atualizar nutricionista:', e);

      // Retornar uma resposta de erro adequada ao cliente
      throw DioException(
        requestOptions: RequestOptions(path: apiUrl),
        type: DioExceptionType.connectionError,
        response: Response(
          requestOptions: RequestOptions(path: apiUrl),
          statusCode: 500,
          statusMessage: 'Erro ao atualizar nutricionista.',
        ),
      );
    }
  }

  Future<Response> deleteNutritionist(String uuid) async {
    String apiUrl = '$apiUrlBase/nutritionists/$uuid';

    try {
      final response = dio.delete(
        apiUrl,
      );
      return response;
    } catch (e) {
      // Registrar a exceção usando um logger
      log.severe('Erro ao remover nutricionista:', e);

      // Retornar uma resposta de erro adequada ao cliente
      throw DioException(
        requestOptions: RequestOptions(path: apiUrl),
        type: DioExceptionType.connectionError,
        response: Response(
          requestOptions: RequestOptions(path: apiUrl),
          statusCode: 500,
          statusMessage: 'Erro ao remover nutricionista.',
        ),
      );
    }
  }
}
