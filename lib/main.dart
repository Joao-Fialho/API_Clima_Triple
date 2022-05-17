import 'package:api_clima_dio_bloc/repository/i_repository_clima.dart';
import 'package:api_clima_dio_bloc/view/clima_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import 'controller/controller_clima.dart';
import 'repository/repositotry_clima.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Dio()),
        Bind.singleton((i) => RepositoryClima(dio: i())),
        Bind.singleton((i) => ControllerClimaBase(repository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: ((context, args) => PageClima(
                  store: context.read(),
                ))),
      ];
}
