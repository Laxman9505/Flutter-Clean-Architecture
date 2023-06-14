import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/core/failure/failure.dart';
import 'package:riverpod_state_management/features/batch/data/data_source/batch_local_data_source.dart';
import 'package:riverpod_state_management/features/batch/domain/entity/batch_entity.dart';
import 'package:riverpod_state_management/features/batch/domain/repository/batch_repository.dart';

final batchLocalRepoProvider = Provider<IBatchRepository>((ref) {
  return BatchLocalRepositoryImpl(
      batchLocalDataSource: ref.read(batchLocalDataSourceProvider));
});

class BatchLocalRepositoryImpl implements IBatchRepository {
  final BatchLocalDataSource batchLocalDataSource;

  BatchLocalRepositoryImpl({required this.batchLocalDataSource});
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
