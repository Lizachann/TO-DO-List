import 'package:flutter/material.dart';
import 'package:front_end/create.dart';
import 'package:front_end/fetch.dart';
import 'package:front_end/state_managment/theme_logic.dart';
import 'state_managment/fontsize_logic.dart';
import 'package:provider/provider.dart';
import 'components/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double size = context.watch<FontSizeLogic>().size;
    int themeIndex = context.watch<ThemeLogic>().themeIndex;

    return Scaffold(
      appBar: const MyAppBar(
        title: "To Do List",
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FetchData()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150 + (4 * size), 50 + (4 * size)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  textStyle: TextStyle(
                    fontSize: 18 + size,
                    overflow: TextOverflow.visible,
                  ),
                  alignment: Alignment.center,
                ),
                child: const Text("Read"),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150 + (4 * size), 50 + (4 * size)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  textStyle: TextStyle(
                    fontSize: 18 + size,
                    overflow: TextOverflow.visible,
                  ),
                  alignment: Alignment.center,
                ),
                child: const Text("Update"),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150 + (4 * size), 50 + (4 * size)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  textStyle: TextStyle(
                    fontSize: 18 + size,
                    overflow: TextOverflow.visible,
                  ),
                  alignment: Alignment.center,
                ),
                child: const Text("Delete"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: Material(
          color: Colors.transparent,
          child: SizedBox(
            width: 80 + size,
            height: 60 + size,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateTask()),
                );
              },
              backgroundColor: themeIndex == 1 ? Colors.blue : Colors.black,
              shape: const CircleBorder(),
              child: Icon(Icons.add, size: 30 + size, color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}
