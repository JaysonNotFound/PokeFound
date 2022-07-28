import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/blocs/main_blocs/main_blocs.dart';
import '../../../widget/routes/empty_page_route_arguments.dart';
import '../../../widget/routes/page_route.dart';
import 'main_page.dart';

class MainPageRoute extends IPageRoute<EmptyPageRouteArguments> {
  @override
  String getRoute() => '/';

  @override
  Widget getWidget() {
    return MultiProvider(
      providers: MainBlocs.get(),
      child: MainPage(),
    );
  }

  @override
  void navigate(BuildContext context, {EmptyPageRouteArguments? arguments}) {
    Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      getRoute(),
      (_) => false,
    );
  }
}
