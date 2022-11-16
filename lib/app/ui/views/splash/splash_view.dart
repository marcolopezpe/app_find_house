import 'package:app_find_house/app/ui/components/templates/custom_scaffold.dart';
import 'package:app_find_house/app/ui/views/splash/splash_controller.dart';
import 'package:app_find_house/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => CustomScaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/find_home.svg'),
              RichText(
                text: TextSpan(
                  text: "Find",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: AppColors.blueDark,
                        fontWeight: FontWeight.w900,
                      ),
                  children: [
                    TextSpan(
                      text: 'Home',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 40.w,
                child: const LinearProgressIndicator(
                  backgroundColor: AppColors.blueDark,
                  color: AppColors.cyan,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
