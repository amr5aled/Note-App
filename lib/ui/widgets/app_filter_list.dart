import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/index.dart';
import 'app_bordered_text.dart';

class FilterList extends StatelessWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      child: Center(
        child: ListView.builder(
            itemCount: 20,
            padding: EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return index == 0
                  ? _buildFilterButton()
                  : AppBorderedText(
                      text: "Womens",
                      selected: index == 1,
                    );
            }),
      ),
    );
  }

  _buildFilterButton() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppPalette.primaryColor),
        child: SvgPicture.asset(
          AppImages.appleLogo,
          width: 22.w,
        ),
      ),
    );
  }
}
