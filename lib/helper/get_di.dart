import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../controller/product_controller.dart';

Future init() async {
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => ProductController());
}
