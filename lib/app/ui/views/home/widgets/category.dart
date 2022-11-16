import 'package:app_find_house/app/data/models/response/response_category_model.dart';
import 'package:app_find_house/app/ui/views/home/home_controller.dart';
import 'package:app_find_house/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Category extends GetView<HomeController> {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 85.h,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => controller.selectedIndex(index),
              child: ItemCategory(
                category: categories[index],
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ItemCategory extends GetView<HomeController> {
  const ItemCategory({
    Key? key,
    required this.category,
    required this.index,
  }) : super(key: key);

  final ResponseCategoryModel? category;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        bool isSelected =
            index == controller.isSelectedIndex.value ? true : false;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 85.w,
          margin: EdgeInsets.only(
            left: isSelected ? 20.w : 11.w,
            bottom: isSelected ? 0 : 20.h,
          ),
          decoration: BoxDecoration(
            color: index == controller.isSelectedIndex.value
                ? AppColors.cyan
                : Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                category!.path ?? "",
                width: 30.w,
                color:
                    isSelected ? Colors.white : AppColors.light.withOpacity(.5),
              ),
              isSelected
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 20.h,
                          right: 5.w,
                          left: 5.w,
                        ),
                        child: Text(
                          category!.name ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        );
      },
    );
  }
}
