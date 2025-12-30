import 'package:assignment_koder/modules/dashboard/controller/dashboard_controller.dart';
import 'package:assignment_koder/routes/app_pages.dart';
import 'package:assignment_koder/shimmers/dashboard_shimmer.dart';
import 'package:assignment_koder/theme/app_colors.dart';
import 'package:assignment_koder/theme/app_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:assignment_koder/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<DashboardController>(
      init: DashboardController(),
        builder: (controller){
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: AppColors.white,
            backgroundColor: AppColors.white,
            centerTitle: true,
            elevation: 1,
            title: Text("Dashboard",style: AppStyles.bold(20, AppColors.black),),
            actions: [
              IconButton(onPressed: (){
                controller.appUtils.logout();
              }, icon: Icon(Icons.logout))
            ],
          ),
          body: RefreshIndicator(
            onRefresh: ()async{
              controller.getProducts();
            },
            child: SizedBox(
              height: size.height,

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(()=>
                    controller.isLoading.value?
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: DashboardShimmer(),
                    ):
                    controller.products.isEmpty?SizedBox(height:size.height,child: NoDataWidget()):ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder:(context,index)=>InkWell(
                          onTap: (){
                            Get.toNamed(Routes.product,arguments: controller.products[index]);
                          },
                          child: Container(

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

                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
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

                                    imageUrl:controller.products[index].image??"",
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("\u20B9${controller.products[index].price}/-",style: AppStyles.bold(20, AppColors.black)),
                                          Text(controller.products[index].category?.capitalizeFirst??"--",style: AppStyles.regularItalic(16, AppColors.black))
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Text(controller.products[index].title??"--",style: AppStyles.semiBold(16, AppColors.black),),
                                      SizedBox(height: 15,),
                                      Text(controller.products[index].description??"--",style: AppStyles.regular(16, AppColors.dataColour),overflow: TextOverflow.ellipsis,maxLines: 3,)

                                    ],
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                      separatorBuilder: (context,index)=>SizedBox(height: 15,),
                      itemCount: controller.products.length,
                    )),
                  ],
                ),
              ),
            ),
          ),
        );
        }
    );
  }
}
