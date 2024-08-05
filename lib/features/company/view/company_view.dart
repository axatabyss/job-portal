
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_portal/core/constant/colors.dart';
import 'package:job_portal/features/company/controller/company_controller.dart';
import 'package:job_portal/features/company/model/company_model.dart';
import 'package:job_portal/features/company/view/widget/company_detail_dialog.dart';




class CompanyView extends GetView<CompanyViewController> {
  const CompanyView({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.ultraLightGreyColor
    ));

    return Scaffold(
      backgroundColor: AppColors.ultraLightGreyColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
        
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: SizedBox(
                      width: 25.w,
                      height: 25.h,
                      child: Image.asset("assets/icons/ic_menu.png", fit: BoxFit.cover),
                    ),
                  ),
        
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 15.w),
                    child: const Icon(Icons.search, size: 20),
                  ),
        
                ],
              ),
        
              Gap(20.h),
              
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Find your Dream\nJob today",
                  style: GoogleFonts.inter(
                    fontSize: 26.sp, fontWeight: FontWeight.w700
                  ),
                ),
              ),
        
              Gap(10.h),

              controller.obx((List<CompanyModel>? companyList) {
                if (companyList != null && companyList.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemCount: companyList.length,
                      itemBuilder: (context, index) {

                        final companyModel = companyList[index];

                        return GestureDetector(
                          onTap: () {

                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height * 0.7,
                                  color: Colors.transparent,
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CompanyDetailDialog(),
                                    ],
                                  ),
                                );
                              },
                            );

                            companyModel.isApplied?.value = true;

                          },
                          child: Card(
                            color: AppColors.whiteColor,
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            child: Container(
                              height: 80.h,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Container(
                                    width: 50.w,
                                    height: 50.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.ultraLightGreyColor,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(300.r),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: companyModel.thumbnailUrl ?? "",
                                        placeholder: (context, url) => Image.asset(
                                          "assets/images/placeholder.png",
                                          fit: BoxFit.cover,
                                        ),
                                        errorWidget: (context, error, stackTrace) => Image.asset(
                                          "assets/images/placeholder.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Gap(10.w),

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          companyModel.title?.substring(0, 2).toUpperCase() ?? "Unknown",
                                          style: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w700)
                                        ),

                                        Gap(5.h),

                                        Text(
                                          companyModel.title ?? "No URL",
                                          maxLines: 1,
                                          style: GoogleFonts.inter(
                                            fontSize: 12.sp,
                                            color: AppColors.greyColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                  Gap(10.w),


                                  SizedBox(
                                    child: Obx(() => Container(
                                      width: 30.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: companyModel.isApplied?.value == true ? AppColors.greenColor : AppColors.primaryColor,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: CircleAvatar(
                                        radius: 50.r,
                                        backgroundColor: AppColors.whiteColor,
                                      ),
                                    )),
                                  )

                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
                onError: (String? msg) => const SizedBox(),
                onEmpty: const SizedBox(),
                onLoading: Expanded(
                  child: Center(
                    child: Container(
                      width: 15.w,
                      height: 15.h,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),



          ],
          ),
        ),
      ),
    );

  }
}
