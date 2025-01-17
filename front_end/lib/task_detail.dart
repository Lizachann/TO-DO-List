import 'package:flutter/material.dart';
import 'package:front_end/components/app_bar.dart';
import 'package:front_end/state_managment/fontsize_logic.dart';
import 'package:front_end/state_managment/theme_logic.dart';
import 'package:provider/provider.dart';

class TaskDetail extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const TaskDetail({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    double size = context.watch<FontSizeLogic>().size;
    int themeIndex = context.watch<ThemeLogic>().themeIndex;

    return Scaffold(
      appBar: const MyAppBar(
        title: "Task Detail",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: Text(
                        title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 32 + size,
                          overflow: TextOverflow.visible,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Text(
                        date,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 20 + size,
                          overflow: TextOverflow.visible,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: themeIndex == 1 ? Colors.black : Colors.white,
                border: const Border(
                  bottom: BorderSide(
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16 + size,
                    overflow: TextOverflow.visible,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
