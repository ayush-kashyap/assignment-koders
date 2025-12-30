import 'package:assignment_koder/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:assignment_koder/theme/app_colors.dart';


class ActionButtonLoader extends StatelessWidget {
  final Function()? onPressed;
  final String? label;
  final double? width;
  final bool isLoading;
  final Color? customDarkColor;

  const ActionButtonLoader({
    super.key,
    required this.onPressed,
     required this.label,
    required this.width,
    required this.isLoading,
    this.customDarkColor,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: isLoading?null:onPressed,
      child: Container(
        width: width,
        padding: EdgeInsets.all(12),

        decoration: BoxDecoration(

          color: onPressed!=null && !isLoading
              ? AppColors.primaryColor
              :AppColors.greyColor,
          borderRadius: BorderRadius.circular(30),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(label??"",style: AppStyles.bold(16, AppColors.white),textAlign: TextAlign.center,),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
            child: isLoading?SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(
                strokeWidth: 1,
                color: AppColors.white,
              ),
            ):SizedBox.shrink(),)
          ],
        )
      ),
    );
  }
}
