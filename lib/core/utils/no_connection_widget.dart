import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:gap/gap.dart";
import "package:get/get.dart";

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({
    super.key,
    this.restartRequired = false,
  });

  final bool restartRequired;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            CircularProgressIndicator(color: Get.theme.primaryColor),

            Gap(20.h),

            Text(
              restartRequired ? "app.restart.required" : "app.no.internet",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
