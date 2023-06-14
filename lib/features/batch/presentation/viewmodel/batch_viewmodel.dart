import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/features/batch/domain/entity/batch_entity.dart';
import 'package:riverpod_state_management/features/batch/domain/use_case/batch_usecase.dart';
import 'package:riverpod_state_management/features/batch/presentation/state/batch_state.dart';

class BatchViewModel extends StateNotifier<BatchState> {
  final BatchUseCase batchUseCase;
  BatchViewModel(this.batchUseCase) : super(BatchState.initial()) {
    getAllBatches();
  }

  Future<void> addBatch(BatchEntity batch) async {
    state.copyWith(isLoading: true);
    var data = await batchUseCase.addBatch(batch);

    data.fold(
        (l) => state = state.copyWith(
              isLoading: false,
              error: l.error,
            ),
        (r) => state = state.copyWith(
              isLoading: false,
              error: null,
            ));
  }

  Future<void> getAllBatches() async {
    state = state.copyWith(isLoading: true);
    var data = await batchUseCase.getAllBatches();

    data.fold(
        (l) => state = state.copyWith(
              isLoading: false,
              error: l.error,
            ),
        (r) => state = state.copyWith(
              isLoading: false,
              batches: r,
            ));
  }
}
