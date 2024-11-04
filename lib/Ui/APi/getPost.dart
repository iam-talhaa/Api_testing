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
  List<PostModel> PostLIst = []; //  Create list to add Data of Api
  Future<List<PostModel>> GetpostAPi() async {
    print("asd");

    var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts')); // Hit Api data

    var maxData =
        jsonDecode(response.body.toString()); // Decode to Dart Formate

    if (response.statusCode == 200) {
      // check status code
      for (var data in maxData) {
        //  it will call every object according to the list of the data in api
        PostLIst.add(PostModel.fromJson(
            data)); //get data through Model and Add that data in postlist;
      }
    } else
      PostLIst; //it will show empty list

    return PostLIst; //it will show data in list
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
