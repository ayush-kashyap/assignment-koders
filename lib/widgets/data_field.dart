import 'package:assignment_koder/theme/app_colors.dart';
import 'package:assignment_koder/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class DataField extends StatelessWidget {
  final String hintText;
  final String? initialValue;
  final bool obscure;
  final int maxLine;
  final AutovalidateMode autoValidateMode;
  final dynamic suffix;
  final dynamic preFix;
  final Color? customColor;
  final Color? customColorDark;
  final controller;
  final acceptPattern;
  final enabled;
  final int? maxLength;
  final keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const DataField({
    super.key,
    required this.hintText,
    this.suffix,
    this.obscure = false,
    this.initialValue,
    this.maxLength,
    this.onChanged,
    this.customColorDark,
    this.maxLine = 1,
    this.customColor,
    this.controller,
    this.enabled = true,
    this.preFix,
    this.acceptPattern,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      child: TextFormField(

        inputFormatters: acceptPattern != null
            ? [
                FilteringTextInputFormatter.allow(acceptPattern),
              ]
            : null,
        maxLength: maxLength,
        controller: controller,
        enabled: enabled,
        validator: validator,
        style: AppStyles.regular(14, AppColors.dataColour),
        autovalidateMode: autoValidateMode,
        initialValue: initialValue,
        obscureText: obscure,
        onChanged: onChanged,
        maxLines: maxLine,
        keyboardType: keyboardType,
        decoration: InputDecoration(


          filled: true,
          fillColor:  AppColors.dataFieldColor,
          counterText: '',
          errorMaxLines: 2,
          suffixIconColor: AppColors.dataColour,
          suffixIcon: suffix != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  child: suffix,
                )
              : null,
          prefixIcon: preFix != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  child: preFix,
                )
              : null,

          hintText: hintText,
          // contentPadding:  suffix==null && preFix==null? EdgeInsets.symmetric(horizontal: 10, vertical: 20):null,
          contentPadding: suffix!=null || preFix!=null? EdgeInsets.symmetric(vertical: 15.0,horizontal: 10): EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
          hintStyle: AppStyles.regular(14, AppColors.dataColour),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:BorderSide.none),

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          isDense: true, // reduces vertical padding
        ),
      ),
    );
  }
}
