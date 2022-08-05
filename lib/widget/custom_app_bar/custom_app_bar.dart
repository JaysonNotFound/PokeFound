import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _buildTitleWidget(),
      centerTitle: false,
      backgroundColor: Colors.red[400],
    );
  }

  Widget _buildTitleWidget() {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
