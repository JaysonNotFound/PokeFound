import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/router/app_router.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.red[400],
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildMenuItemWidget(
                    text: 'Pokedex',
                    icon: Icons.account_tree_outlined,
                    onClicked: () => _handleOnClicked(
                      itemType: MenuItemType.pokedex,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItemWidget({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: color,
        ),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void _handleOnClicked({
    required MenuItemType itemType,
  }) {
    if (itemType == MenuItemType.pokedex) {
      AutoRouter.of(context).navigate(PokemonPageRoutes());
    }
  }
}

enum MenuItemType {
  pokedex,
}
