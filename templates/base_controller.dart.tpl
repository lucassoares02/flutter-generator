import '../../core/state/app_state.dart';
import 'package:flutter/material.dart';
import '../services/response_model.dart';

abstract class BaseController<T> extends ValueNotifier<StateApp> {
  BaseController(super.initialState);

  Future<void> runWithState(Future<ResponseModel> Function() action, ValueNotifier<StateApp> state, {String? errorMessage}) async {
    state.value = LoadingState();
    try {
      final response = await action();
      if (response.success) {
        state.value = SuccessState<T>(response.data);
      } else {
        state.value = ErrorState(response.message);
      }
    } catch (e) {
      state.value = ErrorState(e.toString());
    }
  }
}
