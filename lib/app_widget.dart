import 'package:api_clima_dio_bloc/view/clima_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      debugShowCheckedModeBanner: false,
    );
  }
}
