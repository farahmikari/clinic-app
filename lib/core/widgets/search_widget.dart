import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.0.wp,
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.lbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppDimensions.mp,
        children: [
          SvgPicture.asset(
            AppIcons.search,
            height: AppDimensions.sis,
            width: AppDimensions.mis,
            color: AppColors.darkGreyColor,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: AppColors.mainTextColor,
                fontSize: AppDimensions.mfs,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              ),
              decoration: InputDecoration(
                hintText: "Doctor, Symptom, Facility, Specialty...",
                hintStyle: TextStyle(
                  color: AppColors.hintTextColor,
                  fontSize: AppDimensions.mfs,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(0.0),
              ),
              cursorColor: AppColors.mainTextColor,
              autocorrect: false,
            ),
          ),
        ],
      ),
    );
  }
}
//  Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(AppDimensions.lbr),
//         boxShadow: AppShadow.boxShadow,
//       ),
//       child: TextFormField(
//         style: TextStyle(
//           color: AppColors.mainTextColor,
//           fontSize: AppDimensions.mfs,
//           fontWeight: FontWeight.w500,
//           decoration: TextDecoration.none,
//         ),
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: AppColors.widgetBackgroundColor,

//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppDimensions.lbr),
//             borderSide: BorderSide.none,
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppDimensions.lbr),
//             borderSide: BorderSide.none,
//           ),
//           prefix: SvgPicture.asset(
//             AppIcons.search,
//             height: AppDimensions.sis,
//             colorFilter: ColorFilter.mode(
//               AppColors.darkGreyColor,
//               BlendMode.srcIn,
//             ),
//           ),
//           hintText: "Doctor, Symptom, Facility, Specialty...",
//           hintStyle: TextStyle(
//             color: AppColors.hintTextColor,
//             fontSize: AppDimensions.mfs,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         cursorColor: AppColors.mainTextColor,
//         autocorrect: false,
//       ),
//     );
