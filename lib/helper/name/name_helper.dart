import 'package:injectable/injectable.dart';

import '../../core/enum/pokemon/pokemon_name_type.dart';
import '../../core/extension/string_extension.dart';

@injectable
class NameHelper {
  String parsePokemonName(String rawName) {
    final _noStandardName = rawName.replaceAll('-standard', '');
    final _nameType = _getNameType(_noStandardName);
    final _serializedName = _getSerializedName(
      _noStandardName,
      _nameType,
    );
    return _serializedName;
  }

  PokemonNameType? _getNameType(String name) {
    final _nameSuffix = name.split('-').last;
    if (_nameSuffix == 'mega') return PokemonNameType.mega;
    if (_nameSuffix == 'x') return PokemonNameType.megaX;
    if (_nameSuffix == 'y') return PokemonNameType.megaY;
    if (_nameSuffix == 'gmax') return PokemonNameType.gigantamax;
    if (_nameSuffix == 'alola') return PokemonNameType.alolan;
    if (_nameSuffix == 'galar') return PokemonNameType.galarian;
    if (_nameSuffix == 'hisui') return PokemonNameType.hisuian;
    return null;
  }

  String _getSerializedName(
    String name,
    PokemonNameType? type,
  ) {
    String _name = name;
    if (type == null) {
      _name = _name.replaceAll('-', ' ');
    }

    if (type == PokemonNameType.mega) {
      _name = name.replaceAll("-mega", '').replaceAll('-', ' ');
      _name = 'Mega $_name';
    }

    if (type == PokemonNameType.megaX) {
      _name = name.replaceAll("-mega-x", '').replaceAll('-', ' ');
      _name = 'Mega $_name X';
    }

    if (type == PokemonNameType.megaY) {
      _name = name.replaceAll("-mega-y", '').replaceAll('-', ' ');
      _name = 'Mega $_name Y';
    }

    if (type == PokemonNameType.gigantamax) {
      _name = name.replaceAll("-gmax", '').replaceAll('-', ' ');
      _name = 'Gigantamax $_name';
    }

    if (type == PokemonNameType.alolan) {
      _name = name.replaceAll("-alola", '').replaceAll('-', ' ');
      _name = 'Alolan $_name';
    }

    if (type == PokemonNameType.galarian) {
      _name = name.replaceAll("-galar", '').replaceAll('-', ' ');
      _name = 'Galarian $_name';
    }

    if (type == PokemonNameType.hisuian) {
      _name = name.replaceAll("-hisui", '').replaceAll('-', ' ');
      _name = 'Hisuian $_name';
    }

    return _name.toTitleCase();
  }
}
