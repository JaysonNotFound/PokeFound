import 'package:flutter/material.dart';

import '../../../widget/routes/empty_page_route_arguments.dart';
import '../../../widget/routes/page_route.dart';
import 'main_page.dart';

class MainPageRoute extends IPageRoute<EmptyPageRouteArguments> {
  @override
  String getRoute() => '/';

  @override
  Widget getWidget() {
    return MainPage(); // TODO: Replace MultiProvider once already have main blocs.
  }

  @override
  void navigate(BuildContext context, {EmptyPageRouteArguments? arguments}) {
    Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      getRoute(),
      (_) => false,
    );
  }
}
