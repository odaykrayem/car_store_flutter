// ignore_for_file: file_names
import '../models/comapny_models.dart/company_models.dart';
import '../repositories/company_mdoels_repo.dart';

class CompanyModelsProvider {
  final CompanyModelsRepository _companyModelsRepository;

  CompanyModelsProvider(this._companyModelsRepository);

  Future<List<CompanyModels>> getCompanies(int id) async {
    var companies = await _companyModelsRepository.getCompnyModels(id);
    return companies;
  }
}
