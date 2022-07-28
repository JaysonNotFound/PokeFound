import 'package:flutter/material.dart';

import 'page_route.dart';
import 'page_route_arguments.dart';

class RouteGenerator extends StatefulWidget {
  final String initialRoute;
  final List<IPageRoute<IPageRouteArguments>> routes;

  const RouteGenerator({
    Key? key,
    required this.initialRoute,
    required this.routes,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RouteGenerator();
}

class _RouteGenerator extends State<RouteGenerator> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Navigator(
        initialRoute: widget.initialRoute,
        onGenerateRoute: (settings) {
          var builder = (context) => getWidget(
                context,
                widget.routes.first,
                settings,
              );
          for (var route in widget.routes) {
            if (route.getRoute() != settings.name) {
              continue;
            }
            builder = (context) => getWidget(context, route, settings);
          }

          return MaterialPageRoute<dynamic>(
            builder: builder,
            settings: settings,
          );
        },
      ),
      onWillPop: () async {
        return false;
      },
    );
  }

  Widget getWidget(
    BuildContext context,
    IPageRoute<IPageRouteArguments> route,
    RouteSettings settings,
  ) {
    var widget = route.getWidget();

    widget ??= route.getWidgetWithArguments(
      arguments: settings.arguments as IPageRouteArguments,
    );

    return widget!;
  }
}
