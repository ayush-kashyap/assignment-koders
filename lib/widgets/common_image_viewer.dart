import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:assignment_koder/theme/app_colors.dart';


commonImageViewer(context,img){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      content: Container(
        decoration: BoxDecoration(
          color: AppColors.white
        ),
        height: 400,
        width: 250,
        child: CachedNetworkImage(
          imageUrl: img,
          placeholder: (context, url) => Lottie.asset("assets/image.json",height: 100,width: 100),
          errorWidget: (err, ctx, obj) =>
              Icon(
                Icons.broken_image_outlined,
                color: AppColors.lightGreyContainer,
                size: 250,
              ),
          height: 250,
          width: 250,
          fit: BoxFit.contain,
        ),
      ),
    );
  });
}