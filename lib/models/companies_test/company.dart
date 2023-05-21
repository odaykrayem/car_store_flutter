import '../comapny_models.dart/company_models.dart';

class Company {
  final int id;
  final String name;
  final List<CompanyModels> models;

  const Company({
    required this.id,
    required this.name,
    required this.models,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'models': models,
    };
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      models: (json['models'] as List<dynamic>)
          .map((elemnt) => CompanyModels.fromJson(elemnt))
          .toList(),
    );
  }
}
