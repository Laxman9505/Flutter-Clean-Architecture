import 'package:dartz/dartz.dart';
import 'package:riverpod_state_management/core/failure/failure.dart';
import 'package:riverpod_state_management/features/auth/domain/entity/student_entity.dart';

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerStudent(StudentEntity student);
  Future<Either<Failure, bool>> loginStudent(String username, String password);
}
