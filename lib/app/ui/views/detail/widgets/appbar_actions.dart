import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({Key? key, required this.aviable}) : super(key: key);

  final int aviable;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 50.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              width: 180.w,
              height: 40.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: aviable == 1 ? Colors.green[600] : Colors.red[600],
                  borderRadius: BorderRadius.circular(30.0)),
              child: Text(
                aviable == 1 ? "Available" : "Busy",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icons/heart.svg",
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
