import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const apiUrl = "http://172.23.3.58/api/";

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

  // /////Get Method

  // static gettask() async {
  //   var url = Uri.parse("${apiUrl}get_task");

  //   try {
  //     final response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print(data);
  //     } else {
  //       debugPrint("Failed to get task");
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
}
