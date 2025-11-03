// Arquivo gerado automaticamente
class {{Class}}Model {
  final int id;
  final String name;

  {{Class}}Model({required this.id, required this.name});

  factory {{Class}}Model.fromJson(Map<String, dynamic> json) {
    return {{Class}}Model(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}
