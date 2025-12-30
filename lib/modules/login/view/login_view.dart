import 'package:assignment_koder/modules/login/controller/login_controller.dart';
import 'package:assignment_koder/theme/app_colors.dart';
import 'package:assignment_koder/theme/app_styles.dart';
import 'package:assignment_koder/utils/common_validator.dart';
import 'package:assignment_koder/widgets/action_button_loader.dart';
import 'package:assignment_koder/widgets/data_field.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(
      init: LoginController(),
        builder: (controller){
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100,),
                    Image.asset("assets/fav.png"),
                    Text("Username",style: AppStyles.semiBold(14, AppColors.black),),
                    SizedBox(height: 10,),
                    DataField(
                      hintText: "Enter your username",
                      validator: (value)=>CommonValidator.stringValidator(value,"Username"),
                      onChanged: (value)=>controller.username(value),
                    ),

                    SizedBox(height: 15,),
                    Text("Password",style: AppStyles.semiBold(14, AppColors.black),),
                    SizedBox(height: 10,),
                    Obx(()=>DataField(
                      obscure: controller.obscurePassword.value,
                      hintText: "Enter your password",
                      validator: (value)=>CommonValidator.passwordValidator(value),
                      onChanged: (value)=>controller.password(value),
                      suffix: InkWell(
                        onTap: ()=>controller.obscurePassword(!controller.obscurePassword.value),
                        child: Icon(Icons.remove_red_eye,color: controller.obscurePassword.value?AppColors.greyColor:AppColors.greenColor,),
                      ),
                    )),

                    SizedBox(height: 20,),

                    Obx(()=>ActionButtonLoader(
                        onPressed: (){
                          if(controller.formKey.currentState?.validate()??false){
                            controller.loginUser();
                          }
                        },
                        label: "Login",
                        width: size.width,
                        isLoading: controller.isLoading.value
                    ))
                  ],
                ),
              ),
            ),
          )
        );
        }
    );
  }
}
