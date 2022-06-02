import '../../entities/weather_entity.dart';

abstract class IGetWeatherByCityUsercase{
  Future<WeatherEntity> getClimaByCity(city);
}
