import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/product_controller.dart';
import 'package:product/view/bottom_bar_icon_screen.dart';

class newsScreen extends StatefulWidget {
  const newsScreen({super.key});

  @override
  State<newsScreen> createState() => _newsScreenState();
}

class _newsScreenState extends State<newsScreen> {
  @override
  void initState() {
    Get.find<ProductController>().getNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (userController) {
      return Scaffold(
        appBar: AppBar(title: Text('News Screen')),
        body: userController.userList == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount:
                    (userController.userList!.data![index] as List).length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${userController.userList!.data![index].firstName}'),
                  );
                },
              ),
      );
    });
  }
}
