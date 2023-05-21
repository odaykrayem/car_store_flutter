// ignore_for_file: file_names
import '../models/companies/company_model.dart';
import '../models/companies_test/company.dart';
import '../repositories/company_repo.dart';

class CompanyProvider {
  final CompanyRepository _companyRepository;

  CompanyProvider(this._companyRepository);

  Future<List<Company>> getCompanies() async {
    var companies = await _companyRepository.getCompnaies();
    return companies;
  }
}
