import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/router/app_router.dart';
import '../../domain/entity/pokemon_details_entity.dart';
import '../../domain/entity/pokemon_entity.dart';
import 'bloc/pokemon_card_bloc.dart';

class PokemonCardDetailsWidget extends StatefulWidget {
  final PokemonEntity pokemonEntity;

  const PokemonCardDetailsWidget({
    Key? key,
    required this.pokemonEntity,
  }) : super(key: key);

  @override
  State<PokemonCardDetailsWidget> createState() =>
      _PokemonCardDetailsWidgetState();
}

class _PokemonCardDetailsWidgetState extends State<PokemonCardDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonCardBloc, PokemonCardState>(
      listener: (context, state) => state.maybeWhen(
        failed: _handleRetry,
        orElse: () => {},
      ),
      builder: (context, state) => state.maybeWhen(
        success: (entity) => _buildCardWidget(entity),
        failed: () => _buildCardLoadingWidget(),
        loading: _buildCardLoadingWidget,
        orElse: _buildCardLoadingWidget,
      ),
    );
  }

  Widget _buildCardWidget(
    PokemonDetailsEntity entity,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: _handleOnPressed,
        child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.pokemonEntity.name,
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                ),
              ),
              Image.network(
                widget.pokemonEntity.officialArtWork,
                width: 84,
                loadingBuilder: (context, image, progress) {
                  if (progress == null) return image;
                  return Shimmer.fromColors(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      height: double.infinity,
                      width: 84,
                    ),
                    baseColor: Colors.black12,
                    highlightColor: Colors.black26,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardLoadingWidget() {
    return Text('Loading...');
  }

  void _handleOnPressed() {
    AutoRouter.of(context).push(
      PokemonDetailsPageRoute(
        id: widget.pokemonEntity.id,
      ),
    );
  }

  void _handleRetry() {
    BlocProvider.of<PokemonCardBloc>(context).add(
      PokemonCardEvent.getPokemonById(id: widget.pokemonEntity.id),
    );
  }
}
