import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/router/app_router.dart';
import '../../module/pokemon/domain/entity/pokemon_list/pokemon_list_item_entity.dart';

class PokemonCardWidget extends StatefulWidget {
  final PokemonListItemEntity pokemonEntity;

  const PokemonCardWidget({
    Key? key,
    required this.pokemonEntity,
  }) : super(key: key);

  @override
  State<PokemonCardWidget> createState() => _PokemonCardWidgetState();
}

class _PokemonCardWidgetState extends State<PokemonCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: _handleOnPressed,
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                  widget.pokemonEntity.name.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
              _buildPokemonCardImageWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPokemonCardImageWidget() {
    return CachedNetworkImage(
      imageUrl: widget.pokemonEntity.image,
      width: 64,
      height: 64,
      placeholder: _buildPokemonCardImagePlaceholderWidget,
    );
  }

  Widget _buildPokemonCardImagePlaceholderWidget(
    BuildContext context,
    String image,
  ) {
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
  }

  void _handleOnPressed() {
    AutoRouter.of(context).push(
      PokemonDetailsPageRoute(
        id: widget.pokemonEntity.id,
      ),
    );
  }
}
