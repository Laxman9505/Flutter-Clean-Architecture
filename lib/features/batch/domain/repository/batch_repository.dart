import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/core/failure/failure.dart';
import 'package:riverpod_state_management/features/batch/data/repository/batch_local_repository.dart';
import 'package:riverpod_state_management/features/batch/domain/entity/batch_entity.dart';

final batchRepositoryProvider = Provider<IBatchRepository>((ref) {
  return ref.read(batchLocalRepoProvider);
});

abstract class IBatchRepository {
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();
  Future<Either<Failure, bool>> addBatch(BatchEntity batch);
}
