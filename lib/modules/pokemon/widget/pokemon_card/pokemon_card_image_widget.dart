import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PokemonCardImageWidget extends StatelessWidget {
  final String imageUrl;
  final Color backgroundColor;

  const PokemonCardImageWidget({
    Key? key,
    required this.imageUrl,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      margin: EdgeInsets.all(4),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
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
            Radius.circular(32),
          ),
        ),
        width: 64,
        height: 64,
      ),
      baseColor: Colors.black38,
      highlightColor: Colors.black12,
    );
  }
}
