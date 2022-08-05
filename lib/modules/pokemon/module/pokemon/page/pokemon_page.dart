import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widget/custom_app_bar/custom_app_bar.dart';
import '../../../widget/pokemon_card/pokemon_card_widget.dart';
import '../domain/bloc/pokemon_bloc.dart';
import '../domain/entity/pokemon_list/pokemon_list_entity.dart';

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
      appBar: CustomAppBar(
        title: "Pokédex",
      ),
      body: state.maybeWhen(
        success: _buildPokemonListViewWidget,
        failed: () => Text('Retry...'),
        loading: () => Text('Loading...'),
        orElse: () => Text('Loading...'),
      ),
    );
  }

  Widget _buildPokemonListViewWidget(PokemonListEntity entity) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: entity.pokemons.length,
        itemBuilder: (context, index) => PokemonCardWidget(
          pokemonEntity: entity.pokemons[index],
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    BlocProvider.of<PokemonBloc>(context).add(
      PokemonEvent.getPokemons(),
    );
  }
}
