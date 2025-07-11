import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/todo_view_model.dart';
import 'pages/todo_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TodoViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const TodoPage(),
    );
  }
}
