import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripe/utils/app_colors.dart';
import 'package:stripe/view/screen/home/home_controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController amountController = TextEditingController();
  @override
  void initState() {
    final controller = Get.put(HomeController());
    controller.getAmount();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.pink100,
          elevation: 0,
          title: const Text("Stripe Payment",
            style: TextStyle(color: AppColors.white100,fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: GetBuilder<HomeController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: (){
                    if(amountController.text == ''){
                      Get.snackbar("Error", "Please Enter Amount",colorText: AppColors.white100);
                    }else{
                      controller.makePayment(amount: amountController.text.trim(), currency: "INR");
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.pink100),
                  ),
                  child: const Text("Make Payment",style: TextStyle(color: AppColors.white100),),
                ),
              ),
            );
          }
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: constraints.maxWidth,
                child: Column(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth,
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10,),
                            const Text("Total Amount : ",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.pink60,fontSize: 16),),
                            const SizedBox(height: 20,),
                            GetBuilder<HomeController>(
                              builder: (controller) {
                                return Text("${controller.userAmount}",style: const TextStyle(fontWeight: FontWeight.bold,color: AppColors.pink100,fontSize: 24),);
                              }
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter Amount",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.pink100),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.pink100),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.pink100),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.pink100),
                        ),
                      ),
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
