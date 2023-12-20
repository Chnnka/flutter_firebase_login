import 'package:flutter/material.dart';

class DashboardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      leading: Icon(Icons.menu, color: isDark ? Colors.white60 : Colors.black),
      title: Text(
        'AppName',
        style: textTheme.bodyMedium,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10, top: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.blue.shade300,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_4_rounded),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}