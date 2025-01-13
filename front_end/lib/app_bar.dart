import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state_managment/fontsize_logic.dart';
import 'state_managment/theme_logic.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    int themeIndex = context.watch<ThemeLogic>().themeIndex;

    return AppBar(
      title: Text(title),
      shadowColor: const Color.fromARGB(255, 28, 16, 16),
      elevation: 1,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
      actions: [
        // Font Size Buttons
        IconButton(
          onPressed: () {
            context.read<FontSizeLogic>().decrease();
          },
          icon: const Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
            context.read<FontSizeLogic>().increase();
          },
          icon: const Icon(Icons.add),
        ),
        // Settings Icon as a Popup Menu with Icons for Theme
        PopupMenuButton<int>(
          onSelected: (value) {
            if (value == 0) {
              context.read<ThemeLogic>().changeToSystemMode();
            } else if (value == 1) {
              context.read<ThemeLogic>().changeToLightMode();
            } else if (value == 2) {
              context.read<ThemeLogic>().changeToDarkMode();
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 1,
              child: Row(
                children: [
                  Icon(
                    Icons.light_mode,
                    color: themeIndex == 1 ? Colors.black : Colors.white,
                  ),
                  const SizedBox(width: 8),
                  const Text("Light"),
                ],
              ),
            ),
            PopupMenuItem<int>(
              value: 2,
              child: Row(
                children: [
                  Icon(
                    Icons.dark_mode,
                    color: themeIndex == 1 ? Colors.black : Colors.white,
                  ),
                  const SizedBox(width: 8),
                  const Text("Dark"),
                ],
              ),
            ),
          ],
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
