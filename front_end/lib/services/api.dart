import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front_end/model/task_model.dart';
import 'package:http/http.dart' as http;

class Api {

  static const apiUrl = "http://10.0.2.2:8080/api/";


  /////Post Method

  static addtask(Map pdata) async {
    var url = Uri.parse("${apiUrl}add_task");

    try {
      final response = await http.post(url, body: pdata);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
      } else {
        debugPrint("Failed to add task");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /////Get Method

  static gettask() async {
    var url = Uri.parse("${apiUrl}get_task");

    List<Task> tasks = [];

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint("Tasks ${data['tasks']}");
        data['tasks'].forEach((value) {
          // debugPrint(value);

          tasks.add(Task(
              title: value['ptitle'],
              date: value['pdate'],
              desc: value['pdesc']));
        });

        return tasks;
      } else {
        debugPrint("Failed to get task");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
