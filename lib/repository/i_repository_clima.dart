import '../model/model_clima.dart';

abstract class IRepositoryClima {
  Future<ModelClima> fetchClima(String cidade);
}
