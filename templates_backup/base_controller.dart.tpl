import '../../core/state/app_state.dart';
import 'package:flutter/material.dart';
import '../services/response_model.dart';

abstract class BaseController<T> extends ValueNotifier<StateApp> {
  BaseController(super.initialState);

  Future<void> runWithState(Future<ResponseModel> Function() action, StateApp state, {String? errorMessage}) async {
    state = LoadingState();
    try {
      final response = await action();
      if (response.success) {
        state = SuccessState<T>(response.data);
      } else {
        state = ErrorState(response.message);
      }
    } catch (e) {
      state = ErrorState(e.toString());
    }
  }
}
