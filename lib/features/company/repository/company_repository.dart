import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:job_portal/core/base/base_provider.dart';
import 'package:job_portal/core/base/base_repository.dart';
import 'package:job_portal/core/constant/endpoints.dart';
import 'package:job_portal/features/company/model/company_model.dart';

// Interface for the Company Provider
abstract class ICompanyProvider {
  Future<Response<List<dynamic>>> companyListAPI(String baseUrl);
}

// Company Provider Implementation
class CompanyProvider extends BaseProvider implements ICompanyProvider {
  @override
  Future<Response<List<dynamic>>> companyListAPI(String baseUrl) => get(baseUrl);
}

// Interface for the Company Repository
abstract class ICompanyRepository {
  Future<List<CompanyModel>> companyListAPI();
}

// Company Repository Implementation
class CompanyRepository extends BaseRepository<CompanyProvider> implements ICompanyRepository {
  CompanyRepository() : super(provider: CompanyProvider());

  @override
  Future<List<CompanyModel>> companyListAPI() async {
    try {
      final Response<List<dynamic>> response = await provider.companyListAPI(Endpoints.companyList);
      debugPrint(">>>>>>>>>>>>>>>>>>>>>>>>>>> ${response}");

      if (response.status.hasError) {
        debugPrint("Company List Error: ${response.statusText}");
        return Future.error(response.statusText!);
      } else {
        // Convert the list of maps to a list of CompanyModel objects
        return response.body!.map((e) => CompanyModel.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint(">>>>>>>>>>>>>>>>>>>>>>>>>>> E ${e}");
      rethrow;
    }
  }
}
