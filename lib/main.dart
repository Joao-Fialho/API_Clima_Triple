import 'package:api_clima_dio_bloc/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_widget.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
