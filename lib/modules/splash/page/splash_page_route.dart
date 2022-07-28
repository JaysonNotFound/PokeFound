import 'package:flutter/material.dart';

import '../../../widget/routes/empty_page_route_arguments.dart';
import '../../../widget/routes/page_route.dart';
import 'splash_page.dart';

class SplashPageRoute extends IPageRoute<EmptyPageRouteArguments> {
  @override
  String getRoute() {
    return '/splash';
  }

  @override
  Widget getWidget() => const SplashPage();

  @override
  void navigate(BuildContext context, {EmptyPageRouteArguments? arguments}) {
    Navigator.of(context).pushNamed(getRoute());
  }
}
