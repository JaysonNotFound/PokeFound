import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'modules/_main/page/main_page_route.dart';
import 'modules/splash/domain/bloc/splash_bloc.dart';
import 'modules/splash/page/splash_page_route.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return FutureBuilder(
      future: _initializeDependencies(),
      builder: (context, snapshot) => MultiProvider(
        providers: [
          BlocProvider<SplashBloc>(
            create: (context) => GetIt.I<SplashBloc>(),
          ),
        ],
        child: _buildAppWidget(context),
      ),
    );
  }

  Future<void> _initializeDependencies() async {
    var originalOnError = FlutterError.onError;
    FlutterError.onError = (errorDetails) async {
      // TODO: Add Crashlytics record flutter error.
      originalOnError!(errorDetails);
    };

    await GetIt.instance.allReady();
  }

  Widget _buildAppWidget(BuildContext context) {
    final splashPageRoute = SplashPageRoute();
    final mainPageRoute = MainPageRoute();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: splashPageRoute.getRoute(),
      routes: <String, WidgetBuilder>{
        splashPageRoute.getRoute(): (context) => splashPageRoute.getWidget(),
        mainPageRoute.getRoute(): (context) => mainPageRoute.getWidget(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      builder: (context, widget) {
        return Stack(
          children: <Widget>[
            widget!,
            const SizedBox(),
          ],
        );
      },
    );
  }
}
