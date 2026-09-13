import 'package:flutter/material.dart';
import 'package:movies_app/core/app_assets.dart';
import 'package:movies_app/up_date_profile/Avatar.dart';
import '../core/app_colors.dart';
import '../core/app_icons.dart';
import '../core/app_assets.dart';
import '../core/app_strings.dart';
class UpDateProfileScreen extends StatefulWidget {
  static const routeName = "/UpDateProfileScreen";
  const UpDateProfileScreen({super.key});
  @override
  State<UpDateProfileScreen> createState() => _UpDateProfileScreenState();
}
class _UpDateProfileScreenState extends State<UpDateProfileScreen> {
  String _currentAvatar =AppAssets.profileImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackcolor,
      body:SafeArea(child:
      SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child:Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Padding(padding:  EdgeInsets.only(left:10),
                        child: Image.asset(AppIcons.arrowIcon),),
                    ),
                    SizedBox(width: 80,),
                    Text(AppStrings.PickAvatarstring,style: TextStyle(color:AppColors.orangecolor, fontSize: 20, fontWeight: FontWeight.bold),),
                  ],),
                SizedBox(height: 37,),
                CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage(_currentAvatar),
                ),
                SizedBox(height: 35),
                TextFormField(style: TextStyle(color:AppColors.whitecolor),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon:Padding(padding: EdgeInsets.all(12), child: Image.asset(AppIcons.userIcon,)),
                    hintText:AppStrings.namestring,
                    hintStyle: TextStyle(color: AppColors.whitecolor),
                    fillColor: AppColors.graycolor,
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(12),borderSide:BorderSide.none ),
                  ),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 19,),
                TextFormField(style: TextStyle(color:AppColors.whitecolor),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon:Padding(padding: EdgeInsets.all(12), child: Image.asset(AppIcons.phoneIcon,)),
                    hintText:AppStrings.phonestring,
                    hintStyle: TextStyle(color: AppColors.whitecolor),
                    fillColor: AppColors.graycolor,
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(12),borderSide:BorderSide.none ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20,),
                Align(alignment:Alignment.centerLeft,child: Text(AppStrings.ResetPasswordstring,style: TextStyle(color: AppColors.whitecolor),)),
                SizedBox(height: 297,),
                SizedBox(width:double.infinity,height:55,child: ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:AppColors.redcolor,shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),onPressed:(){},
                    child:Text(AppStrings.DeleteAccountstring,style:TextStyle(color:AppColors.whitecolor,fontWeight:FontWeight.bold),))),
                SizedBox(height: 19,),
                SizedBox(width:double.infinity,height:55,child: ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:AppColors.orangecolor,shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),onPressed:() async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>const AvatarScreen(),),
                  );
                  if(result != null){
                    setState(() {
                      _currentAvatar = result;
                    });
                  }
                },
                    child:Text(AppStrings.UpdateDatastring,style:TextStyle(color:AppColors.blackcolor,fontWeight:FontWeight.bold),)))
              ]
          )
      )
      ),
    );
  }
}