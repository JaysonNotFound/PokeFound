import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/pokemon_card_bloc.dart';
import 'pokemon_card_details_widget.dart';

class PokemonCardWidget extends StatelessWidget {
  final int id;
  const PokemonCardWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final _bloc = GetIt.I<PokemonCardBloc>();
        _bloc.add(
          PokemonCardEvent.getPokemonById(id: id),
        );
        return _bloc;
      },
      child: PokemonCardDetailsWidget(id: id),
    );
  }
}
