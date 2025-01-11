import 'package:flutter/material.dart';
import 'package:front_end/create.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                CreateTask();
              },
              child: const Text("Create")),
          ElevatedButton(onPressed: () {}, child: const Text("Read")),
          ElevatedButton(onPressed: () {}, child: const Text("Update")),
          ElevatedButton(onPressed: () {}, child: const Text("Delete")),
        ],
      ),
    );
  }
}
