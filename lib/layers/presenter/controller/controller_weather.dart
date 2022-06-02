import 'package:api_clima_dio_bloc/layers/domain/usecases/get_weather_by_city/i_get_weather_by_city_usercase.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../errors/exception_weather.dart';
import '../../domain/entities/weather_entity.dart';

class StoreWeather extends StreamStore<Exception, WeatherEntity> {
  final IGetWeatherByCityUsercase usercase;

  StoreWeather({
    required this.usercase,
  }) : super(WeatherEntity(
            temperature: '', wind: '', description: '', forecast: []));

  Future<void> getClimaByCity(city) async {
    setLoading(true);
    try {
      final result = await usercase.getClimaByCity(city);
      update(mapWeather = result);
    } on ExceptionWeather catch (e) {
      setError(RepositoryExceptionWeather(messageError: e.messageError));
    }
    setLoading(false);
  }

  WeatherEntity mapWeather = WeatherEntity(
    temperature: '',
    wind: '',
    description: '',
    forecast: [],
  );

  String getIconClima() {
    if (mapWeather.description == 'Sunny') {
      return 'assets/image/iconSunny.jpg';
    } else if (mapWeather.description == 'Partly cloudy') {
      return 'assets/image/iconPartlyCloudy.jpg';
    } else if (mapWeather.description == 'Patchy rain possible') {
      return 'assets/image/iconPartlyRainPossible.jpg';
    } else {
      return 'assets/image/iconnublado.jpg';
    }
  }
}
