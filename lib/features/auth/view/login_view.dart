
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_portal/core/constant/colors.dart';
import 'package:job_portal/features/auth/controller/login_controller.dart';
import 'package:job_portal/features/company/view/company_view.dart';




class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 20.h),
        color: AppColors.primaryColor,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: const LinearGradient(
              colors: AppColors.textRedGradientColor,
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: const Color(0xFF1B0E29),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Image.asset("assets/icons/ic_logo.png", fit: BoxFit.cover, width: 30.w),

                          Gap(5.w),

                          Text("Job Portal",
                            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.whiteColor),
                          ),

                        ],
                      ),

                      Text("NEED HELP? ",
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.greyColor),
                      ),

                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset("assets/icons/ic_logo.png", fit: BoxFit.cover, width: 100.w),

                      Gap(15.h),

                      Text("LET'S GET STARTED",
                          style: TextStyle(color: AppColors.whiteColor, fontSize: 16.sp, fontWeight: FontWeight.w500)
                      ),

                      Gap(60.h),

                      GestureDetector(
                        onTap: () {
                          controller.signInWithGoogle();
                        },
                        child: Container(
                          height: 40.h,
                          width: double.maxFinite,
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset("assets/icons/ic_google.png"),
                              ),

                              Text("Sign In with Google",
                                  style: TextStyle(color: AppColors.blackColor, fontSize: 12.sp, fontWeight: FontWeight.w700)
                              ),

                            ],
                          ),
                        ),
                      ),

                      Gap(25.h),

                      Text("OR", style: TextStyle(color: AppColors.whiteColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),

                      Gap(25.h),

                      GestureDetector(
                        onTap: () {
                          Get.offAll(const CompanyView());
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Login as ",
                            style: TextStyle(fontSize: 12.sp, color: AppColors.whiteColor, fontWeight: FontWeight.w400),
                            children: [

                              TextSpan(
                                text: "GUEST",
                                style: TextStyle(
                                    fontSize: 12.sp, color: AppColors.iconColor, fontWeight: FontWeight.w500
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      Gap(30.h),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }
}
