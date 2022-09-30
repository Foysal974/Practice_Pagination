
import 'package:finalproject/controllers/home_screen_controller.dart';
import 'package:get/get.dart';

class MyDI extends Bindings{

  @override
  void dependencies() {

    Get.lazyPut<HomeScreenController>(() => HomeScreenController());



  }

}