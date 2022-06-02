import 'package:api_clima_dio_bloc/layers/data/dtos/weather_dto.dart';
import 'package:dio/dio.dart';

import '../../../errors/exception_weather.dart';

import '../../domain/entities/weather_entity.dart';

import 'i_weather_datasourse.dart';

class WeatherDataSourse implements IWeatherDatasourse {
  final Dio dio;
  WeatherDataSourse({
    required this.dio,
  });
  @override
  Future<WeatherEntity> fetchClima(cidade) async {
    try {
      final url = 'https://goweather.herokuapp.com/weather/$cidade';
      final response = await dio.get(url);
      final body = response.data;
      final WeatherEntity json = WeatherDto.fromJson(body);

      return json;
    } on DioError catch (e) {
      throw RepositoryExceptionWeather(messageError: e.message);
    }
  }
}



//injeçao de independecia com modular 

//clean cod e nomeaçao 