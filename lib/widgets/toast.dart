import 'package:assignment_koder/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

showErrorToast(title, {duration=2}){
  return toastification.show(
      icon: Icon(Icons.error_outline_rounded,color: AppColors.redColor,),
      title: Text(title),
      autoCloseDuration: Duration(seconds: duration),
    alignment: AlignmentGeometry.bottomCenter
  );
}
showSuccessToast(title, {duration=2}){
  return toastification.show(
      icon: Icon(Icons.check_circle_outline,color: AppColors.greenColor,),
      title: Text(title),
      autoCloseDuration: Duration(seconds: duration),
      alignment: AlignmentGeometry.bottomCenter
  );
}