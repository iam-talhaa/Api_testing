import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_practice/Ui/APi/PostModel.dart';
import 'package:http/http.dart' as http;

class Get_post_api extends StatefulWidget {
  const Get_post_api({super.key});

  @override
  State<Get_post_api> createState() => _Get_post_apiState();
}

class _Get_post_apiState extends State<Get_post_api> {
  List<PostModel> PostLIst = [];
  Future<List<PostModel>> GetpostAPi() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var maxData = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (var data in maxData) {
        PostLIst.add(PostModel.fromJson(data));
      }
    } else
      PostLIst;

    return PostLIst;
  }

  @override
  Widget build(BuildContext context) {
    print(PostLIst);
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Testing '),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: GetpostAPi(),
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: PostLIst.length,
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Text(PostLIst[index].id.toString())),
                            tileColor: Colors.green,
                            title: Text(
                              PostLIst[index].title.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(PostLIst[index].body.toString()),
                          ),
                        );
                      }),
                );
              })
        ],
      ),
    );
  }
}
