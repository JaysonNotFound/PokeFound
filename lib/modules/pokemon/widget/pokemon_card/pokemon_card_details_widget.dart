import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../helper/name/name_helper.dart';
import '../../module/pokemon/domain/entity/pokemon_list/pokemon_list_item_entity.dart';
import '../../module/pokemon/domain/entity/pokemon_list/pokemon_list_item_type_entity.dart';

class PokemonCardDetailsWidget extends StatelessWidget {
  final PokemonListItemEntity entity;
  final Color backgroundColor;
  const PokemonCardDetailsWidget({
    Key? key,
    required this.entity,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameHelper = GetIt.I<NameHelper>();
    final _name = _nameHelper.parsePokemonName(entity.name);
    final _types = entity.types.map(_buildPokemonTypeWidget).toList();

    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  _name,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 4),
              _buildNumberWidget(),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _types,
          ),
        ],
      ),
    );
  }

  Widget _buildNumberWidget() {
    final _defaultId = entity.defaultId;
    final _number = _defaultId.toString().padLeft(3, '0');
    return Text(
      '#$_number',
      style: TextStyle(
        fontSize: 18,
        color: Color.fromRGBO(0, 0, 0, 0.3),
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget _buildPokemonTypeWidget(
    PokemonListItemTypeEntity typeEntity,
  ) {
    final _type = typeEntity.type;

    final types = entity.types;
    final _isMultipleType = types.length > 1;
    final _isLastType = _type.name == types[types.length - 1].type.name;
    final _lastTypeRightPadding = _isLastType ? 0 : 8;
    final _rightPadding = _isMultipleType ? _lastTypeRightPadding : 0;

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: _rightPadding.toDouble()),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.2),
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
          _type.name.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black38,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
