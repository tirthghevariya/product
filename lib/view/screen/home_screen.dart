import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/product_controller.dart';
import 'package:product/helper/responsive_helper.dart';
import 'package:product/utils/color_utils.dart';
import 'package:product/utils/size_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';

import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.find<ProductController>().getProductList();
    super.initState();
  }

  int productprice = 2500;
  @override
  Widget build(BuildContext context) {
    bool _desktop = ResponsiveHelper.isDesktop(context);
    return GetBuilder<ProductController>(builder: (ProductController) {
      return Scaffold(
        body: ProductController.productModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: ProductController.productModel!.products!.length,
                itemBuilder: (context, index) {
                  final res = ProductController.productModel!.products![index];
                  return Padding(
                      padding:
                          EdgeInsets.only(bottom: 1.h, left: 20.0, right: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(product: res)),
                          );
                        },
                        child: Container(
                          padding: ResponsiveHelper.isDesktop(context)
                              ? const EdgeInsets.all(10.0)
                              : null,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: ResponsiveHelper.isDesktop(context)
                                ? Theme.of(context).cardColor
                                : null,
                            boxShadow: ResponsiveHelper.isDesktop(context)
                                ? const [
                                    BoxShadow(
                                      color: ColorUtils.grey,
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                    )
                                  ]
                                : null,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    // ignore: sort_child_properties_last
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: FadeInImage(
                                                height: _desktop ? 120 : 65,
                                                width: _desktop ? 120 : 80,
                                                fit: BoxFit.cover,
                                                placeholder: MemoryImage(
                                                    kTransparentImage),
                                                image: NetworkImage(
                                                    '${res.thumbnail}'),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizeUtils.w2w,
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                              Text(
                                                '${res.brand}'
                                                ' ${res.title}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.0),
                                              ),
                                              Text(
                                                res.description.toString(),
                                                style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.0),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                res.price! <= productprice
                                                    ? '\$${res.price}'
                                                    : 'Rs${res.price}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.0),
                                              ),
                                            ])),
                                      ],
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: _desktop ? 0 : 5.0,
                                    ))
                              ]),
                        ),
                      ));
                },
              ),
      );
    });
  }
}
