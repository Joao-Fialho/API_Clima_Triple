import 'package:api_clima_dio_bloc/repository/i_repository_clima.dart';
import 'package:dio/dio.dart';

import '../errors/exception_weather.dart';
import '../model/model_clima.dart';

class RepositoryClima implements IRepositoryClima {
  final Dio dio;
  RepositoryClima({
    required this.dio,
  });
  @override
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