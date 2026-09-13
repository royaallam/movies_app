import 'package:flutter/material.dart';
import 'package:movies_app/core/app_assets.dart';
import '../core/app_colors.dart';
import '../core/app_icons.dart';
import '../core/app_strings.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const routeName = "/ForgetPassword";

  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blackcolor,
        body:SafeArea(child:
        Center(
          child:Column(
            children: [

              Row(
                children: [

                  Padding(
                    padding:  EdgeInsets.only(left:34),
                    child: Image.asset(AppIcons.arrowIcon),
                  ),
                  SizedBox(width: 100,),
                  Text(AppStrings.ForgetPasswordstring,style: TextStyle(color:AppColors.orangecolor),),

                ],
              ),
              Image.asset(AppAssets.forgotpasswordImage,width:430,height: 430,),
              TextFormField(
                style: TextStyle(color:AppColors.whitecolor),
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon:Image.asset(AppIcons.vectorIcon,),
                  hintText:AppStrings.Emailstring,
                  hintStyle: TextStyle(color: AppColors.whitecolor),
                  fillColor: AppColors.graycolor,
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(12),borderSide:BorderSide.none ),

                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24,),
              SizedBox(width:double.infinity,height:55,child: ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:AppColors.orangecolor,shape:RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              )),onPressed:(){},
                  child:Text(AppStrings.VerifyEmailstring,style:TextStyle(color:AppColors.blackcolor,fontWeight:FontWeight.bold),)))


            ],
          ),
        )
        )
    );

  }
}
