import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokefound/widget/navigation_drawer/navigation_drawer_widget.dart';

import '../../../domain/bloc/pokemon_bloc.dart';
import '../../../widget/pokemon_card/pokemon_card_widget.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  void initState() {
    BlocProvider.of<PokemonBloc>(context).add(PokemonEvent.getPokemons());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonBloc, PokemonState>(
      listener: _buildPokemonBlocListener,
      builder: _buildPokemonListWidget,
    );
  }

  void _buildPokemonBlocListener(
    BuildContext context,
    PokemonState state,
  ) {
    // TODO: Handle Listener
  }

  Widget _buildPokemonListWidget(
    BuildContext context,
    PokemonState state,
  ) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Pokemon'),
      ),
      body: SafeArea(
          child: state.maybeWhen(
        success: (pokemons) => Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: pokemons
                .map(
                  (pokemon) => PokemonCardWidget(pokemonEntity: pokemon),
                )
                .toList(),
          ),
        ),
        failed: () => Text('Retry...'),
        loading: () => Text('Loading...'),
        orElse: () => Text('Loading...'),
      )),
    );
  }
}
