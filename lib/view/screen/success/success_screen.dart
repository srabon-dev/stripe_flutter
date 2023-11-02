import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripe/core/app_route.dart';
import 'package:stripe/utils/app_colors.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),(){
      Get.offAndToNamed(AppRoute.homeScreen);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: false,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.star,size: 200,color: AppColors.pink100,),
                    SizedBox(height: 10,),
                    Text("thank you your payment has been successful !!",style: TextStyle(color: AppColors.pink60),),
                    CircularProgressIndicator(
                      color: AppColors.pink100,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
