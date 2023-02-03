import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/utils/color_utils.dart';
import 'package:product/utils/size_utils.dart';
import 'package:product/view/bottom_bar_icon_screen.dart';
import '../../controller/product_controller.dart';

class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<FavouriteScreen> {
  int productprice = 2500;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (ProductController) {
        return Scaffold(
            body: ProductController.saveList.isEmpty ||
                    ProductController.cartProduct == []
                ? Center(
                    child: Text('Nothing to show'),
                  )
                : ListView.builder(
                    itemCount: ProductController.saveList.length,
                    itemBuilder: (context, index) {
                      final res = ProductController.saveList[index];
                      return SafeArea(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 10.0, 9.0, 10.0),
                          child: Stack(
                            children: [
                              Card(
                                margin: const EdgeInsets.only(
                                    bottom: 16.0, right: 16.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizeUtils.h3h,
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${res.title}'),
                                              // ignore: prefer_const_constructors
                                              IconButton(
                                                onPressed: () {
                                                  ProductController
                                                      .getremoveSaveList(
                                                          ProductController
                                                              .saveList[index]);
                                                },
                                                // ignore: prefer_const_constructors
                                                icon: Icon(
                                                  Icons.favorite,
                                                  color: ColorUtils.darkred,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizeUtils.h2h,
                                        Text(
                                          '${res.description}',
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                              color: ColorUtils.grey,
                                              fontSize: 14.0,
                                              fontFamily: 'Poppins'),
                                        ),
                                        SizeUtils.h2h,
                                        Text(
                                          res.price! <= productprice
                                              ? '\$${res.price}'
                                              : 'Rs${res.price}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: ColorUtils.lightPink,
                                  backgroundImage:
                                      NetworkImage(res.thumbnail.toString()),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ));
      },
    );
  }
}
