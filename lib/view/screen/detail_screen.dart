import 'dart:developer';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:product/controller/product_controller.dart';
import 'package:product/utils/color_utils.dart';
import 'package:product/utils/size_utils.dart';
import 'package:product/view/bottom_bar_icon_screen.dart';
import 'package:product/view/screen/cart_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../model/product_model.dart';
import 'package:photo_view/photo_view.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.product});
  Product product;

  @override
  State<DetailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<DetailScreen> {
  int productprice = 2500;
  final pagecontroller = PageController();
  IconData? _selectingIcon;
  int activeIndex = 0;
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (productController) {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                productController.addToCart(widget.product, context);
                productController.increasequantity(widget.product);
              },
              child: const Icon(
                Icons.add,
                size: 20.0,
                color: Colors.white,
              )),
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    productController.getSaveProduct(widget.product);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            duration: const Duration(
                              seconds: 2,
                            ),
                            content: Text(
                                '${widget.product.title} Is successfully added in save list')))
                        .close;
                  },
                  icon: Icon(productController.saveList.isEmpty
                      ? Icons.favorite_border
                      : Icons.favorite)),
              IconButton(
                icon: const Icon(Icons.shopping_bag),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const CartScreen();
                    },
                  ));
                },
              )
            ],
            title: Text('Product'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height / 2.5,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                      ),
                      carouselController: buttonCarouselController,
                      items: widget.product.images?.map((i) {
                        return Card(
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 2.5,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration:
                                  const BoxDecoration(color: Colors.amber),
                              child: FadeInImage(
                                placeholder: MemoryImage(kTransparentImage),
                                image: NetworkImage(i),
                                fit: BoxFit.cover,
                              )),
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AnimatedSmoothIndicator(
                          effect: const ExpandingDotsEffect(
                              dotHeight: 10.0, dotWidth: 10.0),
                          activeIndex: activeIndex,
                          count: widget.product.images!.length),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.title.toString(),
                              style: TextStyle(
                                  color: ColorUtils.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        widget.product.price! <= productprice
                            ? '\$${widget.product.price}'
                            : 'Rs${widget.product.price}',
                        style: TextStyle(
                            color: ColorUtils.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
                SizeUtils.h1h,
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.brand.toString(),
                        style:
                            TextStyle(color: ColorUtils.grey.withOpacity(.9)),
                      ),
                    ],
                  ),
                ),
                SizeUtils.h2h,
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Description:',
                              style: TextStyle(
                                color: ColorUtils.black,
                              ),
                            ),
                            SizeUtils.h3h,
                            Text(
                              widget.product.description.toString(),
                              style: TextStyle(
                                color: ColorUtils.grey.withOpacity(.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizeUtils.h2h,
                Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'PERFECT FOR YOU IF YOU ARE LIKE',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizeUtils.h2h,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Wrap(
                            spacing: 10.0,
                            runSpacing: 10.0,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: ColorUtils.lightGreen,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6.0),
                                child: const Text(
                                  'COD Available',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      color: ColorUtils.black),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Color(0xffb2dfdb),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6.0),
                                child: const Text(
                                  '10% instant Discount',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      color: ColorUtils.black),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Color(0xffb2dfdb),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6.0),
                                child: const Text(
                                  'Get GST 28%',
                                  style: TextStyle(
                                      fontFamily: 'poppins',
                                      color: ColorUtils.black),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Color(0xffb2dfdb),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6.0),
                                child: Text(
                                  '${widget.product.stock} piece available',
                                  style: const TextStyle(
                                      fontFamily: 'poppins',
                                      color: ColorUtils.black),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Color(0xffb2dfdb),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6.0),
                                child: Text(
                                  '${widget.product.discountPercentage}% available',
                                  style: const TextStyle(
                                      fontFamily: 'poppins',
                                      color: ColorUtils.black),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: widget.product.rating!.toDouble(),
                      itemBuilder: (context, index) => Icon(
                        _selectingIcon ?? Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 26.0,
                      unratedColor: Colors.amber.withAlpha(50),
                    ),
                    Text.rich(TextSpan(
                        text: "${widget.product.rating} ",
                        style:
                            TextStyle(fontSize: 12.sp, color: ColorUtils.black),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'of 5 basd on reviews', style: TextStyle())
                        ])),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
