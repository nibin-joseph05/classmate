import 'package:flutter/material.dart';
import 'package:classmate/features/students/models/student_model.dart';
import 'package:classmate/features/students/services/student_service.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _rollNumberController = TextEditingController();
  int _selectedYear = 1;

  final StudentService _studentService = StudentService();

  bool _loading = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    try {
      final student = Student(
        id: "",
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        rollNumber: int.parse(_rollNumberController.text.trim()),
        year: _selectedYear,
      );

      await _studentService.addStudent(student);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Student added successfully")),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Student")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(labelText: "First Name"),
                  validator: (v) =>
                  v == null || v.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(labelText: "Last Name"),
                  validator: (v) =>
                  v == null || v.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Required";
                    final emailRegex = RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$");
                    if (!emailRegex.hasMatch(v)) return "Invalid email format";
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _rollNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Roll Number"),
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Required";
                    if (int.tryParse(v) == null) return "Enter a number";
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                DropdownButtonFormField<int>(
                  value: _selectedYear,
                  items: List.generate(
                    5,
                        (index) => DropdownMenuItem(
                      value: index + 1,
                      child: Text("Year ${index + 1}"),
                    ),
                  ),
                  onChanged: (v) => setState(() => _selectedYear = v!),
                  decoration: const InputDecoration(
                    labelText: "Select Year",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _submit,
                    child: _loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Add Student"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
