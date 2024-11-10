import 'package:flutter/material.dart';
import 'package:flutter_api_practice/Ui/comments/C_provider.dart';
import 'package:flutter_api_practice/Ui/comments/UIComment.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CommentProvide()),
      ],
      child: Comment_api_screen(),
    ),
  );
}
