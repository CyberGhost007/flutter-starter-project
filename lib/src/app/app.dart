// Flutter imports:
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/config/const.dart';
import 'package:flutter_app/src/pages/unknown_page.dart';
import 'package:flutter_app/src/services/providers/provider_list.dart';
import 'package:flutter_app/src/services/routers/generated_routes.dart';
import 'package:flutter_app/src/services/routers/routes_paths.dart';
import 'package:flutter_app/src/utils/page_routes_builder.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return MultiProvider(
      providers: ProviderList.getProviders(),
      child: MaterialApp(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        navigatorKey: Const.globalKey,
        initialRoute: RoutesPaths.splash,
        onGenerateRoute: GeneratedRoutes.generateRoute,
        onUnknownRoute: (RouteSettings settings) {
          return PageRoutesBuilder.sharedAxis(
            const UnknownPage(),
            SharedAxisTransitionType.scaled,
          );
        },
      ),
    );
  }
}
