import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:product/view/bottom_bar_icon_screen.dart';

import '../../controller/product_controller.dart';
import '../../utils/color_utils.dart';
import '../../utils/size_utils.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<CartScreen> {
  int productprice = 2500;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (productController) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart List'),
            centerTitle: true,
          ),
          body: productController.cartProduct.isEmpty ||
                  productController.cartProduct == []
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/empty-cart.png'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizeUtils.h2h,
                        const Text(
                          'Your cart is empty',
                          style: TextStyle(
                            color: ColorUtils.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: productController.cartProduct.length,
                          itemBuilder: (context, index) {
                            final res = productController.cartProduct[index];
                            return Dismissible(
                              key: ValueKey(''),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 10.0, 0.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.2,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50.0)),
                                          child: Image.network(
                                              '${res.thumbnail}',
                                              fit: BoxFit.cover),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50.0)),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                6,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                            '${res.title}'),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            productController
                                                                .removeDeleteProduct(
                                                                    productController
                                                                            .cartProduct[
                                                                        index]);
                                                          },
                                                          icon: const Icon(
                                                              Icons.delete))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          res.price! <=
                                                                  productprice
                                                              ? '\$${res.price} x${productController.cartProduct[index].quantity} '
                                                              : 'Rs${res.price}',
                                                        ),
                                                      ),
                                                      SizeUtils.w3w,
                                                      Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              3.4,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                  onTap: () {
                                                                    productController
                                                                        .increasequantity(
                                                                            productController.cartProduct[index]);
                                                                  },
                                                                  child: const Icon(
                                                                      (Icons
                                                                          .add),
                                                                      // right che ha aa video valij app che ? na na ecommerce vali bije che ama j permission muke de ne aana pn data api ma thi j aave che ok ne aa pn apk banava pachi nathi chaltu ok
                                                                      color: ColorUtils
                                                                          .black)),
                                                              Text(
                                                                  '${productController.cartProduct[index].quantity}'),
                                                              InkWell(
                                                                  onTap: () {
                                                                    productController
                                                                        .decreasequantity(
                                                                            productController.cartProduct[index]);
                                                                  },
                                                                  child: const Icon(
                                                                      (Icons
                                                                          .remove),
                                                                      color: ColorUtils
                                                                          .black)),
                                                            ],
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizeUtils.h2h,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total:'),
                            Text('${productController.totalPrice}')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
