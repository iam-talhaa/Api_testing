import 'package:flutter/material.dart';
import 'package:flutter_api_practice/Ui/comments/C_provider.dart';
import 'package:provider/provider.dart';

class Comment_api_screen extends StatefulWidget {
  const Comment_api_screen({super.key});

  @override
  State<Comment_api_screen> createState() => _Comment_api_screenState();
}

class _Comment_api_screenState extends State<Comment_api_screen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommentProvide(),
      child: Consumer<CommentProvide>(
          builder: (context, model, child) => Scaffold(
                body: Column(
                  children: [
                    FutureBuilder(
                        future: model.Get_comment_api(),
                        builder: (context, snapshot) {
                          return Expanded(
                            child: ListView.builder(
                                itemCount: model.commentList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                        '${model.commentList[index].name}'),
                                    subtitle: Text(
                                        '${model.commentList[index].body}'),
                                  );
                                }),
                          );
                        })
                  ],
                ),
              )),
    );
  }
}
