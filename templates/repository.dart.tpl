import '../../core/services/response_model.dart';
import '../../core/services/http_service.dart';
import '{{base}}_model.dart';

class {{Class}}Repository {
  final httpService = HttpService();

  Future<ResponseModel> find(int id) async {
    try {
      ResponseModel response = await httpService.get("{{base}}/$id");
      List list = response.data as List;
      final item = list.map((e) => {{Class}}Model.fromJson(e)).toList();
      response.data = item;
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> findAll() async {
    try {
      ResponseModel response = await httpService.get("{{base}}");
      List list = response.data as List;
      final item = list.map((e) => {{Class}}Model.fromJson(e)).toList();
      response.data = item;
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> create({{Class}}Model data) async {
    try {
      ResponseModel response = await httpService.post("{{base}}", data.toJson());
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> update({{Class}}Model data) async {
    try {
      ResponseModel response = await httpService.patch("{{base}}", data.toJson());
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel> delete(int id) async {
    try {
      ResponseModel response = await httpService.delete("{{base}}/$id");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
