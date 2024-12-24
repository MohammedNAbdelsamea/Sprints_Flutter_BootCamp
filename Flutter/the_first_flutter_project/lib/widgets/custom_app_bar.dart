import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff004EFE),
      title: const Text(
        'My First Project',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
