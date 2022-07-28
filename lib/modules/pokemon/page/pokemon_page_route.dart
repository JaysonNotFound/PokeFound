import 'package:flutter/material.dart';

import '../../../../../widget/routes/empty_page_route_arguments.dart';
import '../../../../../widget/routes/page_route.dart';
import 'pokemon_page.dart';

class PokemonPageRoute extends IPageRoute<EmptyPageRouteArguments> {
  @override
  String getRoute() {
    return '/pokemon';
  }

  @override
  Widget getWidget() => const PokemonPage();

  @override
  void navigate(BuildContext context, {EmptyPageRouteArguments? arguments}) {
    Navigator.of(context).pushNamed(getRoute());
  }
}
