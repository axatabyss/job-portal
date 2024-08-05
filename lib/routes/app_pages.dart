

import 'package:get/get.dart';
import 'package:job_portal/features/auth/binding/login_binding.dart';
import 'package:job_portal/features/auth/view/login_view.dart';
import 'package:job_portal/features/company/binding/company_binding.dart';
import 'package:job_portal/features/company/view/company_view.dart';

import 'app_routes.dart';



class AppPages {
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[

    GetPage<LoginView>(
      name: AppRoutes.LOGIN,
      page: () => const LoginView(),
      transition: Transition.fadeIn,
      binding: LoginBinding(),
      preventDuplicates: true,
    ),

    GetPage<CompanyView>(
      name: AppRoutes.COMPANY,
      page: () => const CompanyView(),
      transition: Transition.fadeIn,
      binding: CompanyViewBinding(),
      preventDuplicates: true,
    ),

  ];
}
