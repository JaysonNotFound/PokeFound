import 'package:flutter/material.dart';

import '../../../widget/routes/empty_page_route_arguments.dart';
import '../../../widget/routes/page_route.dart';
import 'home_page.dart';

class HomePageRoute extends IPageRoute<EmptyPageRouteArguments> {
  @override
  String getRoute() {
    return '/home';
  }

  @override
  Widget getWidget() {
    return const HomePage();
  }

  @override
  void navigate(BuildContext context, {EmptyPageRouteArguments? arguments}) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        settings: RouteSettings(
          name: getRoute(),
        ),
        pageBuilder: (context, _, __) => getWidget(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }
}
