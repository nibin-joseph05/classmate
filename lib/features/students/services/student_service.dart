import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:classmate/features/students/models/student_model.dart';

class StudentService {
  final CollectionReference studentsRef =
  FirebaseFirestore.instance.collection('students');

  /// Check roll number uniqueness
  Future<bool> isRollNumberUsed(int rollNumber) async {
    final query = await studentsRef
        .where('rollNumber', isEqualTo: rollNumber)
        .get();

    return query.docs.isNotEmpty;
  }

  /// Add student with validation
  Future<void> addStudent(Student student) async {
    final exists = await isRollNumberUsed(student.rollNumber);

    if (exists) {
      throw "Roll Number already exists";
    }

    await studentsRef.add(student.toMap());
  }

  /// Fetch all students
  Stream<List<Student>> getStudents() {
    return studentsRef.snapshots().map((query) {
      return query.docs.map((doc) {
        return Student.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  /// Delete
  Future<void> deleteStudent(String id) async {
    await studentsRef.doc(id).delete();
  }
}
