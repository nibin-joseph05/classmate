class Student {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final int rollNumber;
  final int year;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.rollNumber,
    required this.year,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'rollNumber': rollNumber,
      'year': year,
    };
  }

  static Student fromMap(String id, Map<String, dynamic> map) {
    return Student(
      id: id,
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      rollNumber: map['rollNumber'],
      year: map['year'],
    );
  }
}
