import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'core/app_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51NrcLcSJXOqjAG5dxabD5XzUNXE0S3xjn4tFp8aJqZZR4SsQOCZ3SM9MNTbFgCYopG7R8d0XcgvvY9AM6SIxCQKX00mzWSTRUm";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      initialRoute: AppRoute.homeScreen,
      navigatorKey: Get.key,
      transitionDuration: const Duration(milliseconds: 200),
      getPages: AppRoute.routes,
    );
  }
}
