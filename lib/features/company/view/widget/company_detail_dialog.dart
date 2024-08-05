

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_portal/core/constant/colors.dart';





class CompanyDetailDialog extends StatefulWidget {
  const CompanyDetailDialog({super.key});

  @override
  State<CompanyDetailDialog> createState() => _CompanyDetailDialogState();
}

class _CompanyDetailDialogState extends State<CompanyDetailDialog> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.r),
              topLeft: Radius.circular(16.r),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 40.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Text("Google LLC",
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp, fontWeight: FontWeight.w700,
                                ),
                              ),

                              const Icon(Icons.star_border, color: AppColors.lightGreyColor, size: 25,),

                            ],
                          ),

                          Gap(10.h),

                          Text("Silicon Valley, CA",
                            style: GoogleFonts.inter(
                              fontSize: 11.sp, color: AppColors.greyColor, fontWeight: FontWeight.w500,
                            ),
                          ),

                          Gap(10.h),

                          Text("Tech Based Company and the producer",
                            style: GoogleFonts.inter(
                              fontSize: 12.sp, color: AppColors.greyColor, fontWeight: FontWeight.w500,
                            ),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 40.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Role",
                            style: GoogleFonts.inter(
                              fontSize: 11.sp, color: AppColors.greyColor, fontWeight: FontWeight.w500,
                            ),
                          ),

                          Gap(5.h),

                          Text("Senior UI/UX Designer",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp, fontWeight: FontWeight.w600,
                            ),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 40.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Qualification",
                            style: GoogleFonts.inter(
                              fontSize: 11.sp, color: AppColors.greyColor, fontWeight: FontWeight.w500,
                            ),
                          ),

                          Gap(5.h),

                          Text("Applicants must have at least up to 10 years of design experience and must be familiar with some design",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp, fontWeight: FontWeight.w600, height: 2.5
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),

              GestureDetector(
                onTap: () {

                  Get.back();

                  Get.snackbar("Success", "Job Applied Successfully", snackPosition: SnackPosition.BOTTOM, colorText: AppColors.whiteColor,
                    backgroundColor: AppColors.greenColor.withOpacity(0.7),
                    margin: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w)
                  );

                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Container(
                    height: 40.h,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text("APPLY NOW",
                      style: GoogleFonts.inter(
                        fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.whiteColor
                      ),
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),

        Transform.translate(
          offset: const Offset(50, -50),
          child: Container(
            width: 80.w,
            height: 80.h,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteColor,
            ),
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.ultraLightGreyColor,
              ),
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/icons/ic_google.png")
            ),
          ),
        ),

      ],
    );
  }

}

