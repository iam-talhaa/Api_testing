import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_practice/Ui/comments/Api_model.dart';

import 'package:http/http.dart' as http;

class CommentProvide extends ChangeNotifier {
  List<Comment_Model> commentList = [];
  Get_comment_api() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    var maxdata = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (var data in maxdata) {
        commentList.add(Comment_Model.fromJson(data));
      }
      return commentList;
    } else {
      return commentList;
    }
  }
}
