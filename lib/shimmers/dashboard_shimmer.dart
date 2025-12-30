import 'package:assignment_koder/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Column(
      children: [
        Container(
          decoration: BoxDecoration(
              boxShadow:[
                BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 10,
                    spreadRadius: 2
                )
              ],
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              Shimmer.fromColors(
                  baseColor: AppColors.shimmerColor,
                  highlightColor: AppColors.lightWhite,
                  child: Container(
                    height: 300,
                    width: size.width,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      color: AppColors.shimmerColor,
                    ),
                  )
              ),
              Padding(padding: EdgeInsets.all(20),
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                          baseColor: AppColors.shimmerColor,
                          highlightColor: AppColors.lightWhite,
                          child: Container(
                            height: 20,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: AppColors.shimmerColor,
                            ),
                          )
                      ),
                      Shimmer.fromColors(
                          baseColor: AppColors.shimmerColor,
                          highlightColor: AppColors.lightWhite,
                          child: Container(
                            height: 20,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: AppColors.shimmerColor,
                            ),
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Shimmer.fromColors(
                      baseColor: AppColors.shimmerColor,
                      highlightColor: AppColors.lightWhite,
                      child: Container(
                        height: 30,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.shimmerColor,
                        ),
                      )
                  ),
                  SizedBox(height: 10,),
                  Shimmer.fromColors(
                      baseColor: AppColors.shimmerColor,
                      highlightColor: AppColors.lightWhite,
                      child: Container(
                        height: 150,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.shimmerColor,
                        ),
                      )
                  ),
                ],
              )
              ),

            ],
          ),
        ),

      ],
    );
  }
}
