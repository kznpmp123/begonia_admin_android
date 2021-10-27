import 'package:get/route_manager.dart';
import 'package:kozarni_ecome/screen/check_out_screen.dart';
import 'package:kozarni_ecome/screen/detail_screen.dart';
import 'package:kozarni_ecome/screen/home_screen.dart';

const String homeScreen = '/home';
const String checkOutScreen = '/checkout';
const String detailScreen = '/detail';

List<GetPage> routes = [
  GetPage(
    name: homeScreen,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: checkOutScreen,
    page: () => CheckOutScreen(),
  ),
  GetPage(
    name: detailScreen,
    page: () => DetailScreen(),
  )
];
