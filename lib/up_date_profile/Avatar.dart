import 'package:flutter/material.dart';
import 'package:movies_app/core/app_assets.dart';
import '../core/app_colors.dart';
import '../core/app_assets.dart';
import '../core/app_strings.dart';
class AvatarScreen extends StatelessWidget {
  static const routeName = "/Avatar";

  const AvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> avatars = [
      AppAssets.Image1, AppAssets.Image2, AppAssets.Image3,
      AppAssets.Image4, AppAssets.Image5, AppAssets.Image6,
      AppAssets.Image7, AppAssets.Image8, AppAssets.Image9,
    ];

    return Scaffold(
      backgroundColor: AppColors.blackcolor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context ),
                    child: Icon(Icons.arrow_back, color: AppColors.whitecolor),
                  ),
                  SizedBox(width: 80),
                  Text(
                    AppStrings.PickAvatarstring,
                    style: TextStyle(
                      color: AppColors.orangecolor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Expanded(
                child: GridView.builder(
                  itemCount: avatars.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),

                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context, avatars[index]);
                      },
                      child: ClipOval(
                        child: Image.asset(avatars[index], fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}