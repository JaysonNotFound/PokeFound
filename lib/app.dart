import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'core/router/app_router.dart';
import 'modules/splash/domain/bloc/splash_bloc.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return FutureBuilder(
      future: _initializeDependencies(),
      initialData: false,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // TODO: Add Crashlytics record error.
        }

        final initialized = snapshot.data == true;
        if (initialized) {
          return _buildAppWidget(context);
        }

        return Container(color: Colors.white);
      },
    );
  }

  Future<bool> _initializeDependencies() async {
    try {
      var originalOnError = FlutterError.onError;
      FlutterError.onError = (errorDetails) async {
        // TODO: Add Crashlytics record flutter error.
        originalOnError!(errorDetails);
      };

      await GetIt.instance.allReady();
      return true;
    } catch (_) {
      return false;
    }
  }

  Widget _buildAppWidget(BuildContext context) {
    final _appRouter = AppRouter();
    return MultiProvider(
      providers: [
        BlocProvider<SplashBloc>(
          create: (context) => GetIt.I<SplashBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
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
      ),
    );
  }
}
