// import 'package:flutter/material.dart';
// import 'package:front_end/model/task_model.dart';
// import 'package:front_end/services/api.dart';

// class FetchData extends StatelessWidget {
//   const FetchData({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Task Detail'),
//       ),
//       body: FutureBuilder(
//           future: Api.gettask(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             // print(snapshot.data);
//             print("Snapshot hasData: ${snapshot.hasData}");
//             if (!snapshot.hasData) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else {
//               List<Task> tasks = snapshot.data;
//               print(tasks);
//               return ListView.builder(
//                 itemCount: tasks.length,
//                 itemBuilder: (context, index) {
//                   print(tasks[index].title);

//                   return Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: RefreshIndicator(
//                         onRefresh: Api.gettask,
//                         child: ListTile(
//                           leading: const Icon(Icons.storage),
//                           title: Text(tasks[index].title),
//                           subtitle: Text(tasks[index].desc),
//                           trailing: Text(tasks[index].date),
//                         ),
//                       ),
//                     ),
//                   );

//                 },
//               );
//             }
//           }),
//     );
//   }
// }

// return (Text(tasks[index].title));
// return ListTile(
//   leading: const Icon(Icons.storage),
//   title: Text(tasks[index].title),
//   subtitle: Text(tasks[index].desc),
//   trailing: Text(tasks[index].date),
// );

// import 'package:flutter/material.dart';
// import 'package:front_end/model/task_model.dart';
// import 'package:front_end/services/api.dart';

// class FetchData extends StatefulWidget {
//   const FetchData({Key? key}) : super(key: key);

//   @override
//   State<FetchData> createState() => _FetchDataState();
// }

// class _FetchDataState extends State<FetchData> {
//   List<Task> tasks = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchTasks();
//   }

//   Future<void> _fetchTasks() async {
//     try {
//       List<Task> fetchedTasks = await Api.gettask();
//       setState(() {
//         tasks = fetchedTasks;
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       debugPrint("Error fetching tasks: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Task Detail'),
//       ),
//       body: isLoading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : tasks.isEmpty
//               ? const Center(
//                   child: Text('No tasks available.'),
//                 )
//               : ListView.builder(
//                   itemCount: tasks.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10.0, vertical: 6.0),
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         elevation: 5,
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 tasks[index].title,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 tasks[index].desc,
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     tasks[index].date,
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.blueGrey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:front_end/components/app_bar.dart';
import 'package:front_end/model/task_model.dart';
import 'package:front_end/services/api.dart';
import 'package:front_end/state_managment/fontsize_logic.dart';
import 'package:front_end/state_managment/theme_logic.dart';
import 'package:front_end/task_detail.dart';
import 'package:provider/provider.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  List<Task> tasks = []; // List to store fetched tasks
  bool isLoading = false; // Track loading state

  @override
  void initState() {
    super.initState();
    _fetchTasks(); // Fetch tasks initially
  }

  Future<void> _fetchTasks() async {
    setState(() {
      isLoading = true; // Show loading indicator
    });
    try {
      final fetchedTasks = await Api.gettask(); // Fetch tasks from API
      setState(() {
        tasks = fetchedTasks; // Update the task list
      });
    } catch (error) {
      Text('Error fetching tasks: $error');
    } finally {
      setState(() {
        isLoading = false; // Hide loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = context.watch<FontSizeLogic>().size;
    int themeIndex = context.watch<ThemeLogic>().themeIndex;

    return Scaffold(
      appBar: const MyAppBar(
        title: 'Task Detail',
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Show loading indicator
          : RefreshIndicator(
              onRefresh: _fetchTasks, // Call _fetchTasks on pull-down
              child: tasks.isEmpty
                  ? const Center(
                      child: Text('No tasks found.'),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Icon(
                                  Icons.add_box,
                                  color: themeIndex == 1
                                      ? Colors.black
                                      : Colors.white,
                                  size: 30 + size,
                                ),
                              ),
                              title: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TaskDetail(
                                        title: tasks[index].title,
                                        description: tasks[index].desc,
                                        date: tasks[index].date,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tasks[index].title,
                                      style: TextStyle(
                                        color: themeIndex == 1
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 24 + size,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      tasks[index].date,
                                      style: TextStyle(
                                        color: themeIndex == 1
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 16 + size,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              trailing: PopupMenuButton<int>(
                                onSelected: (value) {
                                  if (value == 0) {
                                  } else if (value == 1) {}
                                },
                                itemBuilder: (context) => [
                                  PopupMenuItem<int>(
                                    value: 0,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.edit,
                                          color: themeIndex == 1
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                        const SizedBox(width: 8),
                                        const Text("Edit"),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem<int>(
                                    value: 1,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          color: themeIndex == 1
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                        const SizedBox(width: 8),
                                        const Text("Delete"),
                                      ],
                                    ),
                                  ),
                                ],
                                icon: Icon(
                                  Icons.more_vert,
                                  color: themeIndex == 1
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                color: themeIndex == 1
                                    ? Color.fromARGB(255, 244, 253, 255)
                                    : Color.fromARGB(255, 0, 16, 36),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
    );
  }
}
