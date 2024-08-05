
import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_portal/features/auth/controller/login_controller.dart';
import 'package:job_portal/features/company/controller/company_controller.dart';
import 'package:job_portal/firebase_options.dart';
import 'package:job_portal/routes/app_pages.dart';
import 'package:job_portal/routes/app_routes.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/utils/connectivity_util.dart';
import 'core/utils/getx_services.dart';
import 'core/utils/global_variables.dart';
import 'core/utils/keyboard_util.dart';
import 'features/company/repository/company_repository.dart';




Future<void> initServices() async {
  ConnectivityUtil.configureConnectivityStream();

  GlobalVariables.app.client = Dio(
    BaseOptions(
      headers: <String, String>{
        "Content-Type": "application/json;charset=utf-8",
        "Accept": "application/json;charset=utf-8",
      },
    ),
  );

  debugPrint('Starting GetX Services...');
  await Future.wait(
    <Future<dynamic>>[
      Get.putAsync(() => GlobalVariablesService().init()),
    ],
  );
  debugPrint('All GetX Services Started...');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((onValue) {
    Get.put(LoginController());
  });
  debugPrint('Firebase & Login Controller initialize... ');
}


Future<void> main() async {
  debugPrint = (String? message, {int? wrapWidth}) {
    if (!kReleaseMode) {
      log(message.toString());
    }
  };

  runZonedGuarded<Future<void>>(() async {
      WidgetsFlutterBinding.ensureInitialized();

      await initServices();
      setPathUrlStrategy();

      runApp(const MyApp());
    }, (Object error, StackTrace stack) {
      debugPrint('ErrorAboutApp: $error, $stack');
    },
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey movieAppKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KeyboardUtil.hideKeyboard(context),
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, child) {

            final MediaQueryData mediaQueryData = MediaQuery.of(context);

            return MediaQuery(
              data: mediaQueryData.copyWith(
                platformBrightness: Brightness.light,
                alwaysUse24HourFormat: true,
                textScaler: const TextScaler.linear(1.0),
                boldText: false,
              ),
              child: GetMaterialApp(
                key: movieAppKey,
                debugShowCheckedModeBanner: false,
                title: 'Job Portal',
                themeMode: ThemeMode.dark,
                defaultTransition: Transition.fadeIn,
                getPages: AppPages.routes,
                initialRoute: AppRoutes.LOGIN,
                enableLog: kDebugMode,
                logWriterCallback: (String text, {bool isError = false}) {
                  debugPrint("GetXLog: $text");
                },
                navigatorObservers: <NavigatorObserver>[
                  GetObserver(),
                ],
              ),
            );

          }
      ),
    );
  }
}
