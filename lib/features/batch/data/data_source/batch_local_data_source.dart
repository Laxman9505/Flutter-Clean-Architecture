import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/core/failure/failure.dart';
import 'package:riverpod_state_management/core/network/local/hive_service.dart';
import 'package:riverpod_state_management/features/batch/data/model/batch_hive_model.dart';
import 'package:riverpod_state_management/features/batch/domain/entity/batch_entity.dart';

final batchLocalDataSourceProvider = Provider<BatchLocalDataSource>((ref) {
  return BatchLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    batchHiveModel: ref.read(batchHiveModelProvider),
  );
});

class BatchLocalDataSource {
  final HiveService hiveService;
  final BatchHiveModel batchHiveModel;

  BatchLocalDataSource({
    required this.hiveService,
    required this.batchHiveModel,
  });

  // Add Batch
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) async {
    try {
      // Convert Entity to Hive Object
      final hiveBatch = batchHiveModel.toHiveModel(batch);

      // ADd to Hive

      await hiveService.addBatch(hiveBatch);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // Get All batches

  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      // Get All Batches from Hive

      final batches = await hiveService.getAllBatches();
      // Convert Hice Object to Entity
      final batchEntities = batchHiveModel.toEntityList(batches);
      return Right(batchEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
