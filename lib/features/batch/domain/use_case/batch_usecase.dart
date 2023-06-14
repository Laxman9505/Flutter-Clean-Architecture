import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/core/failure/failure.dart';
import 'package:riverpod_state_management/features/batch/domain/entity/batch_entity.dart';
import 'package:riverpod_state_management/features/batch/domain/repository/batch_repository.dart';

final batchusecaseProvider = Provider<BatchUseCase>((ref) {
  return BatchUseCase(batchRepository: ref.read(batchRepositoryProvider));
});

class BatchUseCase {
  final IBatchRepository batchRepository;
  BatchUseCase({required this.batchRepository});

  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    return batchRepository.getAllBatches();
  }

  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    return batchRepository.addBatch(batch);
  }
}
