import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_state_management/config/constants/hive_table_constant.dart';
import 'package:riverpod_state_management/features/batch/domain/entity/batch_entity.dart';
import 'package:uuid/uuid.dart';

//  dart run build_runner build --delete-conflicting-outputs
part 'batch_hive_model.g.dart';

final batchHiveModelProvider = Provider((ref) => BatchHiveModel.empty());

@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel {
  @HiveField(0)
  final String? batchId;

  @HiveField(1)
  final String batchName;

  BatchHiveModel({String? batchId, required this.batchName})
      : batchId = batchId ?? const Uuid().v4();

  // Empty Constructor
  BatchHiveModel.empty() : this(batchId: '', batchName: '');
  // Convert Hive Object to Entity
  //
  BatchEntity toEntity() => BatchEntity(batchName: batchName, batchId: batchId);

  // Convert Entity to Hive Object

  BatchHiveModel toHiveModel(BatchEntity entity) =>
      BatchHiveModel(batchName: entity.batchName);

  // Convert Hive List to Entity List

  List<BatchEntity> toEntityList(List<BatchHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
