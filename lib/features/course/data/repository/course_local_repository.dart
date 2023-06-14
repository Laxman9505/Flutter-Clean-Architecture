import 'package:dartz/dartz.dart';
import 'package:riverpod_state_management/core/failure/failure.dart';
import 'package:riverpod_state_management/features/batch/domain/entity/batch_entity.dart';
import 'package:riverpod_state_management/features/course/domain/repository/course_repository.dart';

class CourseLocalRepositoryImpl implements ICourseRepository {
  @override
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    // TODO: implement addBatch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    // TODO: implement getAllBatches
    throw UnimplementedError();
  }
}
