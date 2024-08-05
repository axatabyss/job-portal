


import 'package:get/get.dart';
import 'package:job_portal/features/company/controller/company_controller.dart';

import '../repository/company_repository.dart';



class CompanyViewBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<CompanyProvider>(() => CompanyProvider());
    Get.lazyPut<CompanyRepository>(() => CompanyRepository());

    Get.lazyPut(() => CompanyViewController(companyRepository: Get.find()), fenix: true);

  }
}
