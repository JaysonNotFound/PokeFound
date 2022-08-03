import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/single_child_widget.dart';

import '../../../modules/pokemon/module/pokemon/domain/bloc/pokemon_bloc.dart';
import '../../../modules/pokemon/module/pokemon_details/domain/bloc/pokemon_details_bloc.dart';

class MainBlocs {
  static List<SingleChildWidget> get() => [
        BlocProvider(create: (context) => GetIt.I<PokemonBloc>()),
        BlocProvider(create: (context) => GetIt.I<PokemonDetailsBloc>()),
      ];
}
