import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PokemonDetailsPage extends StatefulWidget {
  final int id;
  const PokemonDetailsPage({
    Key? key,
    @PathParam() required this.id,
  }) : super(key: key);

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Pokemon: ${widget.id}'),
    );
  }
}
