import 'package:flutter/material.dart';

import '../../../core/routes/routes.dart';
import '../../../widget/routes/route_generator.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RouteGenerator(
      initialRoute: '/home',
      routes: Routes.get(),
    );
  }
}
