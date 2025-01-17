import 'package:flutter/material.dart';
import 'package:front_end/fetch.dart';
import 'package:front_end/services/api.dart';
import 'package:front_end/state_managment/fontsize_logic.dart';
import 'package:front_end/state_managment/theme_logic.dart';
import 'package:provider/provider.dart';
import 'components/app_bar.dart';

class CreateTask extends StatefulWidget {
  
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = context.watch<FontSizeLogic>().size;
    int themeIndex = context.watch<ThemeLogic>().themeIndex;

    return Scaffold(
      appBar: const MyAppBar(
        title: "Add Task",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 10),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(
                    fontSize: 26 + size,
                    overflow: TextOverflow.visible,
                    color: themeIndex == 1
                        ? const Color.fromARGB(255, 93, 93, 93)
                        : const Color.fromARGB(255, 202, 202, 202),
                  ),
                ),
                style: TextStyle(
                  fontSize: 26 + size,
                  overflow: TextOverflow.visible,
                  color: themeIndex == 1 ? Colors.black : Colors.white,
                ),
                minLines: 1,
                maxLines: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 10),
              child: TextField(
                controller: dateController,
                decoration: InputDecoration(
                  hintText: "Date",
                  hintStyle: TextStyle(
                    fontSize: 20 + size,
                    overflow: TextOverflow.visible,
                    color: themeIndex == 1
                        ? const Color.fromARGB(255, 93, 93, 93)
                        : const Color.fromARGB(255, 202, 202, 202),
                  ),
                ),
                style: TextStyle(
                  fontSize: 20 + size,
                  overflow: TextOverflow.visible,
                  color: themeIndex == 1 ? Colors.black : Colors.white,
                ),
                minLines: 1,
                maxLines: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 10),
              child: TextField(
                controller: desController,
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(
                    fontSize: 20 + size,
                    overflow: TextOverflow.visible,
                    color: themeIndex == 1
                        ? const Color.fromARGB(255, 93, 93, 93)
                        : const Color.fromARGB(255, 202, 202, 202),
                  ),
                ),
                style: TextStyle(
                  fontSize: 20 + size,
                  overflow: TextOverflow.visible,
                  color: themeIndex == 1 ? Colors.black : Colors.white,
                ),
                minLines: 4,
                maxLines: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: () {
                  var data = {
                    "ptitle": titleController.text,
                    "pdate": dateController.text,
                    "pdesc": desController.text,
                  };
                  Api.addtask(data);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FetchData()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150 + (4 * size), 50 + (4 * size)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  alignment: Alignment.center,
                  backgroundColor: themeIndex == 1 ? Colors.blue : Colors.black,
                ),
                child: Text(
                  "Create Task",
                  style: TextStyle(
                    fontSize: 18 + size,
                    overflow: TextOverflow.visible,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150 + (4 * size), 50 + (4 * size)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  alignment: Alignment.center,
                  backgroundColor: themeIndex == 1 ? Colors.blue : Colors.black,
                ),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 18 + size,
                    overflow: TextOverflow.visible,
                    color: Colors.white,
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
