import 'package:flutter/foundation.dart';
import '../models/student.dart';

class AttendanceProvider extends ChangeNotifier {
  final List<Student> _students = [
    Student(name: 'Hussain Muhammad Abdullah'),
    Student(name: 'Momshad Dinury'),
    Student(name: 'Foysal Ahmed'),
    Student(name: 'Raisa Sultana'),
    Student(name: 'Imran Ali'),
    Student(name: 'Lamia Nusrat'),
    Student(name: 'Farhan Ahmed'),
    Student(name: 'Mahbubur Rahman'),
    Student(name: 'Rifat Hasan'),
    Student(name: 'Nazmul Hossain'),
  ];

  List<Student> get students => _students;

  int get presentCount => _students.where((s) => s.isPresent).length;
  int get absentCount => _students.where((s) => !s.isPresent).length;

  void toggleAttendance(int index) {
    _students[index].isPresent = !_students[index].isPresent;
    notifyListeners();
  }
}
