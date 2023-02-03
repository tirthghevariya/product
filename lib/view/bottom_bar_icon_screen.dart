import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/auth_controller.dart';
import 'package:product/utils/color_utils.dart';

import 'package:product/view/screen/cart_screen.dart';
import 'package:product/view/screen/home_screen.dart';
import 'package:product/view/screen/profile_screen.dart';
import 'package:product/view/screen/favourite_screen.dart';
import 'package:sizer/sizer.dart';

class BottomBarMainScreen extends StatefulWidget {
  BottomBarMainScreen({super.key, required this.userName});
  String userName;
  @override
  State<BottomBarMainScreen> createState() => _HomeScreenState();
}

int index = 0;
bool enablefeedBack = false;

class _HomeScreenState extends State<BottomBarMainScreen> {
  @override
  Widget build(BuildContext context) {
    List Screens = [
      HomeScreen(),
      FavouriteScreen(),
      CartScreen(),
      ProfileScreen(
        userName: '${widget.userName}',
      ),
    ];
    return Scaffold(
      body: Screens[index],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                // enableFeedback: enablefeedBack ,
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
                icon: Icon(index == 0 ? Icons.home : Icons.home_outlined,
                    color: index == 0 ? ColorUtils.black : ColorUtils.grey,
                    size: 20.sp)),
            IconButton(
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                },
                icon: Icon(index == 1 ? Icons.favorite : Icons.favorite_border,
                    color: index == 1 ? ColorUtils.black : ColorUtils.grey,
                    size: 20.sp)),
            IconButton(
              onPressed: () {
                setState(() {
                  index = 2;
                });
              },
              icon: Icon(
                  index == 2
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined,
                  color: index == 2 ? ColorUtils.black : ColorUtils.grey,
                  size: 20.sp),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    index = 3;
                  });
                },
                icon: Icon(
                    index == 3
                        ? Icons.person_rounded
                        : Icons.person_outline_rounded,
                    color: index == 3 ? ColorUtils.black : ColorUtils.grey,
                    size: 20.sp)),
          ],
        ),
      ),
    );
  }
}
