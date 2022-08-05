import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../pokemon/module/pokemon/domain/bloc/pokemon_bloc.dart';
import '../../pokemon/module/pokemon_details/domain/bloc/pokemon_details_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.I<PokemonBloc>()),
        BlocProvider(create: (context) => GetIt.I<PokemonDetailsBloc>()),
      ],
      child: AutoRouter(),
    );
  }
}
