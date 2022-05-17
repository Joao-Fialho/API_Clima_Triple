import 'package:dio/dio.dart';

import '../errors/exception_weather.dart';
import '../model/model_clima.dart';

class RepositoryClima {
  final Dio dio;
  RepositoryClima({
    required this.dio,
  });
  Future<ModelClima> fetchClima(cidade) async {
    try {
      final url = 'https://goweather.herokuapp.com/weather/$cidade';

      final response = await dio.get(url);
      final body = response.data;
      final ModelClima json = ModelClima.fromJson(body);

      return json;
    } on DioError catch (e) {
      throw RepositoryExceptionWeather(messageError: e.message);
    }
  }
}



//injeçao de independecia com modular 

//clean cod e nomeaçao 