import 'package:flutter/material.dart';
import 'package:classmate/features/students/services/student_service.dart';
import 'package:classmate/features/students/models/student_model.dart';
import 'package:classmate/features/students/screens/add_student/add_student_screen.dart';

class StudentListScreen extends StatelessWidget {
  StudentListScreen({super.key});

  final StudentService _studentService = StudentService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddStudentScreen()),
              );
            },
          )
        ],
      ),
      body: StreamBuilder<List<Student>>(
        stream: _studentService.getStudents(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final students = snapshot.data!;

          if (students.isEmpty) {
            return const Center(child: Text("No students added yet"));
          }

          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final s = students[index];

              return ListTile(
                title: Text("${s.firstName} ${s.lastName}"),
                subtitle: Text("Roll: ${s.rollNumber} | Year: ${s.year}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _studentService.deleteStudent(s.id);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
