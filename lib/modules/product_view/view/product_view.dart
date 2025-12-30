import 'package:assignment_koder/modules/product_view/controller/product_view_controller.dart';
import 'package:assignment_koder/theme/app_colors.dart';
import 'package:assignment_koder/theme/app_styles.dart';
import 'package:assignment_koder/widgets/common_image_viewer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return GetBuilder<ProductViewController>(
      init: ProductViewController(),
        builder: (controller){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            surfaceTintColor: AppColors.white,
            centerTitle: true,
            title: Text("Product View",style: AppStyles.bold(20, AppColors.black),),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  commonImageViewer(context, controller.product.image);
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  padding: EdgeInsets.all( 10),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border(bottom: BorderSide(
                          width: 1,color: AppColors.borderColor
                      )),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                  ),
                  child: CachedNetworkImage(

                    imageUrl:controller.product.image??"",
                    placeholder: (context, url) => Lottie.asset("assets/lottie.json",height: 100,width: 100),
                    errorWidget: (err, ctx, obj) =>
                        Icon(
                          Icons.broken_image_outlined,
                          color: AppColors.lightGreyContainer,
                          size: 250,
                        ),
                    height: 300,
                    width: size.width,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\u20B9${controller.product.price}/-",style: AppStyles.bold(20, AppColors.black)),
                        Text(controller.product.category?.capitalizeFirst??"--",style: AppStyles.regularItalic(16, AppColors.black))
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text(controller.product.title??"--",style: AppStyles.semiBold(16, AppColors.black),),
                    SizedBox(height: 15,),
                    Text(controller.product.description??"--",style: AppStyles.regular(16, AppColors.dataColour))

                  ],
                ),
              )

            ],
          ),
        );

        }
    );
  }
}
