import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/pokemon_details_entity.dart';
import 'bloc/pokemon_card_bloc.dart';

class PokemonCardDetailsWidget extends StatelessWidget {
  final int id;

  const PokemonCardDetailsWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCardBloc, PokemonCardState>(
      builder: (context, state) => state.maybeWhen(
        success: (entity) => _buildCardWidget(entity),
        failed: () => _buildCardRetryWidget(context),
        loading: _buildCardLoadingWidget,
        orElse: _buildCardLoadingWidget,
      ),
    );
  }

  Widget _buildCardWidget(
    PokemonDetailsEntity entity,
  ) {
    return Text(entity.name);
  }

  Widget _buildCardLoadingWidget() {
    return Text('Loading...');
  }

  Widget _buildCardRetryWidget(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleCardRetry(context),
      child: Text('Retry...'),
    );
  }

  void _handleCardRetry(BuildContext context) {
    BlocProvider.of<PokemonCardBloc>(context).add(
      PokemonCardEvent.getPokemonById(id: id),
    );
  }
}
