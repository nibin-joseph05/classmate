import 'package:flutter/material.dart';
import 'package:classmate/features/students/models/student_model.dart';
import 'package:classmate/features/students/services/student_service.dart';

class EditStudentScreen extends StatefulWidget {
  final Student student;

  const EditStudentScreen({super.key, required this.student});

  @override
  State<EditStudentScreen> createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _service = StudentService();

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController rollNumber;
  late TextEditingController year;

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    firstName = TextEditingController(text: widget.student.firstName);
    lastName = TextEditingController(text: widget.student.lastName);
    email = TextEditingController(text: widget.student.email);
    rollNumber = TextEditingController(text: widget.student.rollNumber.toString());
    year = TextEditingController(text: widget.student.year.toString());
  }

  Future<void> _update() async {
    if (!_formKey.currentState!.validate()) return;

    final updated = Student(
      id: widget.student.id,
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      email: email.text.trim(),
      rollNumber: int.parse(rollNumber.text),
      year: int.parse(year.text),
    );

    setState(() => _loading = true);

    try {
      await _service.updateStudent(updated.id, updated);
      Navigator.pop(context); // return to list
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Student updated successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Student"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextField(
                controller: firstName,
                decoration: const InputDecoration(labelText: "First Name"),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: lastName,
                decoration: const InputDecoration(labelText: "Last Name"),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: email,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: rollNumber,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Roll Number"),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: year,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Year (1–5)"),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _loading ? null : _update,
                child: _loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Update Student"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
