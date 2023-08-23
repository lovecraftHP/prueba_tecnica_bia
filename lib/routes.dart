import 'package:flutter/material.dart';
import 'package:prueba_tecnica_bia/ui/screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case 'detail':
        return MaterialPageRoute(
          builder: (context) => const DetailPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
