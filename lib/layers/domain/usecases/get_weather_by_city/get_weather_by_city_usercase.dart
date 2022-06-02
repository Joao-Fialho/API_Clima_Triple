import 'package:api_clima_dio_bloc/layers/domain/usecases/get_weather_by_city/i_get_weather_by_city_usercase.dart';
import '../../repositories/i_repository_weather.dart';
import '../../entities/weather_entity.dart';

class GetWeatherByCityUsercase implements IGetWeatherByCityUsercase {
  IRepositoryWeather repository;
  GetWeatherByCityUsercase(
    this.repository,
  );

  @override
  Future<WeatherEntity> getClimaByCity(city) async {
    return await repository.fetchClima(city);
  }
}
