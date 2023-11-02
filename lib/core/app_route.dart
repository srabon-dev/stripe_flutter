import 'package:get/get.dart';
import 'package:stripe/view/screen/home/home_screen.dart';
import 'package:stripe/view/screen/success/success_screen.dart';

class AppRoute {

  static  String homeScreen = "/home_screen";
  static  String successScreen = "/success_screen";

  static List<GetPage> routes = [
    GetPage(name: homeScreen, page: ()=> const HomeScreen()),
    GetPage(name: successScreen, page: ()=> const SuccessScreen()),
  ];
}