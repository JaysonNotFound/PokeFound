import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../../core/router/app_router.dart';
import '../../module/pokemon/domain/entity/pokemon_list/pokemon_list_item_entity.dart';
import 'pokemon_card_details_widget.dart';
import 'pokemon_card_image_widget.dart';

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
    return FutureBuilder<PaletteGenerator>(
      future: _generateColorPalette(),
      builder: (context, snapshot) {
        return _buildPokemonCardWidget(snapshot.data);
      },
    );
  }

  Widget _buildPokemonCardWidget(
    PaletteGenerator? pallete,
  ) {
    final _cardBackgroundColor = pallete?.dominantColor?.color ?? Colors.white;
    final _hslColor = HSLColor.fromColor(_cardBackgroundColor);
    final _hslLight = _hslColor.withLightness(0.85);
    final _cardBackgroundLightColor = _hslLight.toColor();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: _handleOnPressed,
        child: Container(
          height: 82,
          decoration: BoxDecoration(
            color: _cardBackgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          child: Row(
            children: [
              PokemonCardImageWidget(
                imageUrl: widget.pokemonEntity.image,
                backgroundColor: _cardBackgroundLightColor,
              ),
              SizedBox(width: 8),
              Expanded(
                child: PokemonCardDetailsWidget(
                  entity: widget.pokemonEntity,
                  backgroundColor: _cardBackgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<PaletteGenerator> _generateColorPalette() async {
    final _paletteGenerator = await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(
        widget.pokemonEntity.image,
      ),
      filters: <PaletteFilter>[
        _avoidColorsPaletteFilter,
      ],
    );
    return _paletteGenerator;
  }

  bool _avoidColorsPaletteFilter(HSLColor color) {
    final _isDark = color.lightness <= 0.3;
    final _isLight = color.lightness >= 0.85;
    return !_isLight && !_isDark;
  }

  void _handleOnPressed() {
    AutoRouter.of(context).push(
      PokemonDetailsPageRoute(
        id: widget.pokemonEntity.id,
      ),
    );
  }
}
