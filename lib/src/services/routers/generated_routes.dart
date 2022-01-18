import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_app/src/pages/home/home_page.dart';
import 'package:flutter_app/src/pages/splash_page.dart';
import 'package:flutter_app/src/pages/unknown_page.dart';
import 'package:flutter_app/src/services/routers/routes_paths.dart';
import 'package:flutter_app/src/utils/page_routes_builder.dart';

class GeneratedRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesPaths.splash:
        return PageRoutesBuilder.sharedAxis(
          const SplashPage(),
          SharedAxisTransitionType.horizontal,
        );
      case RoutesPaths.home:
        return PageRoutesBuilder.sharedAxis(
          const HomePage(),
          SharedAxisTransitionType.horizontal,
        );
      default:
        return PageRoutesBuilder.sharedAxis(
          const UnknownPage(),
          SharedAxisTransitionType.horizontal,
        );
    }
  }
}
