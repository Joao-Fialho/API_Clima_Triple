import 'package:flutter_modular/flutter_modular.dart';
import 'package:api_clima_dio_bloc/layers/data/datasourse/weather_datasourse.dart';
import 'package:dio/dio.dart';

import 'layers/data/repositories/repositotry_weather.dart';
import 'layers/domain/usecases/get_weather_by_city/get_weather_by_city_usercase.dart';
import 'layers/presenter/controller/controller_weather.dart';
import 'layers/presenter/ui/pages/clima_page.dart';
class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Dio()),
        Bind.singleton((i) => RepositoryWeather(i())),
        Bind.singleton((i) => WeatherDataSourse(dio: i())),
        Bind.singleton((i) => StoreWeather(usercase: i())),
        Bind.singleton((i) => GetWeatherByCityUsercase(i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: ((context, args) => PageClima(
                  store: context.read(),
                ))),
      ];
}
