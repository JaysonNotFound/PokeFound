import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../modules/home/page/home_page.dart';
import '../../modules/pokemon/module/pokemon/page/pokemon_page.dart';
import '../../modules/pokemon/module/pokemon_details/page/pokemon_details_page.dart';
import '../../modules/splash/page/splash_page.dart';

part 'app_router.gr.dart';

const pokemonRoute = AutoRoute(
  path: 'pokemon',
  page: EmptyRouterPage,
  name: 'PokemonPageRoutes',
  children: <AutoRoute>[
    AutoRoute(
      path: '',
      page: PokemonPage,
    ),
    AutoRoute(
      path: ':id',
      page: PokemonDetailsPage,
    ),
  ],
);

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      path: '/splash',
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      path: '/home',
      page: HomePage,
      children: <AutoRoute>[
        RedirectRoute(path: '', redirectTo: 'pokemon'),
        pokemonRoute,
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
