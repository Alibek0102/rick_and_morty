import 'package:flutter/material.dart';

class BaseHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BaseHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
