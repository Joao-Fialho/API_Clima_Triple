import 'package:api_clima_dio_bloc/layers/data/datasourse/weather_datasourse.dart';

import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/i_repository_weather.dart';

class RepositoryWeather implements IRepositoryWeather {
  final WeatherDataSourse dataSourse;
  RepositoryWeather(
    this.dataSourse,
  );

  @override
  Future<WeatherEntity> fetchClima(String cidade) async {
    return await dataSourse.fetchClima(cidade);
  }
}



//injeçao de independecia com modular 

//clean cod e nomeaçao 