import 'package:flutter_triple/flutter_triple.dart';
import '../errors/exception_weather.dart';
import '../model/model_clima.dart';
import '../repository/i_repository_clima.dart';

class ControllerClimaBase extends StreamStore<Exception, ModelClima> {
  final IRepositoryClima repository;

  ControllerClimaBase({
    required this.repository,
  }) : super(ModelClima(
            temperature: '', wind: '', description: '', forecast: []));

  Future<void> getClimaByCity(cidade) async {
    setLoading(true);
    try {
      final modelClima = await repository.fetchClima(cidade);
      update(mapClima = modelClima);
    } on ExceptionWeather catch (e) {
      setError(RepositoryExceptionWeather(messageError: e.messageError));
    }
    setLoading(false);
    // notifyListeners();
  }

  ModelClima mapClima = ModelClima(
    temperature: '',
    wind: '',
    description: '',
    forecast: [],
  );

  String getIconClima() {
    if (mapClima.description == 'Sunny') {
      return 'assets/image/iconSunny.jpg';
    } else if (mapClima.description == 'Partly cloudy') {
      return 'assets/image/iconPartlyCloudy.jpg';
    } else if (mapClima.description == 'Patchy rain possible') {
      return 'assets/image/iconPartlyRainPossible.jpg';
    } else {
      return 'assets/image/iconnublado.jpg';
    }
  }
}
