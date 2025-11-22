import 'package:flutter/material.dart';
import 'package:classmate/features/students/screens/student_list/student_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ClassMate Home")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Manage Students"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => StudentListScreen()),
            );
          },
        ),
      ),
    );
  }
}
