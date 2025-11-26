import 'package:default_project/features/{{base}}/{{base}}_usecase.dart';
import 'package:default_project/core/state/app_state.dart';
import '../../core/state/base_controller.dart';
import 'package:flutter/material.dart';
import '{{base}}_model.dart';

class {{Class}}Controller extends BaseController<{{Class}}Model> {
  final {{Class}}UseCase {{base}}Usecase;

  {{Class}}Controller(super.initialState, this.{{base}}Usecase);

  ValueNotifier<StateApp<StartState>> stateFind = ValueNotifier(StartState());
  ValueNotifier<StateApp<StartState>> stateFindAll = ValueNotifier(StartState());
  ValueNotifier<StateApp<StartState>> stateCreate = ValueNotifier(StartState());
  ValueNotifier<StateApp<StartState>> stateUpdate = ValueNotifier(StartState());
  ValueNotifier<StateApp<StartState>> stateDelete = ValueNotifier(StartState());

  Future<void> find(int id) async => runWithState(() => {{base}}Usecase.find(id), stateFind);
  Future<void> findAll() async => runWithState(() => {{base}}Usecase.findAll(), stateFindAll);
  Future<void> create({{Class}}Model data) async => runWithState(() => {{base}}Usecase.create(data), stateCreate);
  Future<void> update({{Class}}Model data) async => runWithState(() => {{base}}Usecase.update(data), stateUpdate);
  Future<void> delete(int id) async => runWithState(() => {{base}}Usecase.delete(id), stateDelete);
}
