import 'package:gitfetch/view/screen/detail/details.dart';
import 'package:gitfetch/view/screen/home/home.dart';
import 'constaint/routes_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Home()),
  GetPage(name: AppRoute.details, page: () => const Details()),
];
