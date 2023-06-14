import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/state/student_state.dart';

import '../model/student.dart';

final studentViewModelProvider =
    StateNotifierProvider<StudentViewModel, StudentState>(
  (ref) => StudentViewModel(),
);

class StudentViewModel extends StateNotifier<StudentState> {
  StudentViewModel() : super(StudentState.initialState()) {
    getAllStudents();
  }

  void addStudent(Student student) {
    // Progress bar lai ghumaideu
    state = state.copyWith(isLoading: true);
    // Students lai state ma add gardeu
    state.students.add(student);

    // Progress bar lai rokhdeu
    state = state.copyWith(isLoading: false);
  }

  void getAllStudents() {
    state = state.copyWith(isLoading: true);
    state.students = [
      Student(fname: 'John', lname: 'Don', dob: '01/12/1999'),
      Student(fname: 'John1', lname: 'Don don', dob: '04/12/1999'),
      Student(fname: 'John2', lname: 'Bhai', dob: '01/02/1099'),
    ];
    state = state.copyWith(isLoading: false);
  }

  void deleteStudent(Student student) {
    state = state.copyWith(isLoading: true);
    state.students.remove(student);
    state = state.copyWith(isLoading: false);
  }
}
