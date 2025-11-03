// Arquivo gerado automaticamente
import 'package:default_project/features/{{base}}/{{base}}_model.dart';

import '../../core/services/response_model.dart';
import '{{base}}_repository.dart';

class {{Class}}UseCase {
  final {{Class}}Repository repository;

  {{Class}}UseCase(this.repository);

  Future<ResponseModel> findAll() async {
    return await repository.findAll();
  }

  Future<ResponseModel> find(int id) async {
    return await repository.find(id);
  }

  Future<ResponseModel> create({{Class}}Model data) async {
    return await repository.create(data);
  }

  Future<ResponseModel> update({{Class}}Model data) async {
    return await repository.update(data);
  }

  Future<ResponseModel> delete(int id) async {
    return await repository.delete(id);
  }
}
