

import 'package:job_portal/core/base/base_controller.dart';
import 'package:job_portal/features/company/model/company_model.dart';
import 'package:job_portal/features/company/repository/company_repository.dart';



class CompanyViewController extends BaseRepositoryController<CompanyRepository, CompanyProvider, List<CompanyModel>> {
  CompanyViewController({required this.companyRepository}) : super(repository: companyRepository);

  final CompanyRepository companyRepository;

  Future<List<CompanyModel>> _getCompanyList() async {
    final List<CompanyModel> companyResponse = await repository.companyListAPI();
    return companyResponse ?? <CompanyModel>[];
  }

  Future<void> appendCompanyList() async {
    append(() => _getCompanyList);
  }

  @override
  void onReady() {
    super.onReady();
    appendCompanyList();
  }
}