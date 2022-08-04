import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/router/app_router.dart';
import '../../../../helper/name/name_helper.dart';
import '../../module/pokemon/domain/entity/pokemon_list/pokemon_list_item_entity.dart';
import '../../module/pokemon/domain/entity/pokemon_list/pokemon_list_item_type_entity.dart';

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
      future: _updatePaletteGenerator(),
      builder: (context, snapshot) {
        return _buildPokemonCardWidget(snapshot.data);
      },
    );
  }

  Widget _buildPokemonCardWidget(
    PaletteGenerator? pallete,
  ) {
    final _nameHelper = GetIt.I<NameHelper>();
    final _name = _nameHelper.parsePokemonName(widget.pokemonEntity.name);
    final _number = widget.pokemonEntity.defaultId.toString().padLeft(3, '0');
    final _cardColor = pallete?.dominantColor?.color ?? Colors.white;

    final hsl = HSLColor.fromColor(_cardColor);
    final hslLight = hsl.withLightness(
      (hsl.lightness + 0.05).clamp(0.0, 1.0),
    );
    final contentContainerColor = hslLight.toColor();

    final _types =
        widget.pokemonEntity.types.map(_buildPokemonTypeWidget).toList();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: _handleOnPressed,
        child: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: _cardColor,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              _buildPokemonCardImageWidget(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 8,
                    right: 16,
                  ),
                  height: 80,
                  decoration: BoxDecoration(
                    color: contentContainerColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#$_number',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        _name,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: _types,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPokemonTypeWidget(
    PokemonListItemTypeEntity type,
  ) {
    final types = widget.pokemonEntity.types;
    final _isMultiple = types.length > 1;
    final _isLastItem = type.type.name == types[types.length - 1].type.name;
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          right: _isMultiple
              ? _isLastItem
                  ? 0
                  : 8
              : 0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        padding: EdgeInsets.all(4),
        child: Text(
          type.type.name.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black38,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Future<PaletteGenerator> _updatePaletteGenerator() async {
    final _paletteGenerator = await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(
        widget.pokemonEntity.image,
      ),
      filters: <PaletteFilter>[_avoidColorsPaletteFilter],
    );
    return _paletteGenerator;
  }

  bool _avoidColorsPaletteFilter(HSLColor color) {
    const double _blackMaxLightness = 0.5;
    final _isBlack = color.lightness <= _blackMaxLightness;

    const double _whiteMinLightness = 0.95;
    final _isWhite = color.lightness >= _whiteMinLightness;

    return !_isWhite && !_isBlack;
  }

  Widget _buildPokemonCardImageWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: CachedNetworkImage(
        imageUrl: widget.pokemonEntity.image,
        width: 64,
        height: 64,
        placeholder: _buildPokemonCardImagePlaceholderWidget,
      ),
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
