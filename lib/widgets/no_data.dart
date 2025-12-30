import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:assignment_koder/theme/app_colors.dart';
import 'package:assignment_koder/theme/app_styles.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({this.height,super.key});
  final height;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: height??size.height*0.7,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error,color: AppColors.redColor,size: 80,),
              SizedBox(height: 20,),
              Text("No data",style: AppStyles.regular(18, AppColors.black),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text("This page seems to be empty!",style: AppStyles.regular(14, AppColors.black),textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}
