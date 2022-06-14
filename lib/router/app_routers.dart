import 'package:fl_pos_app/screen/dashboard/screen/dashboard_screen.dart';
import 'package:fl_pos_app/screen/masterMenu/brand/screen/brand_screen.dart';
import 'package:fl_pos_app/screen/masterMenu/category/screen/category_screen.dart';
import 'package:fl_pos_app/screen/masterMenu/item/screen/item_screen.dart';
import 'package:fl_pos_app/screen/not_found.dart';
import 'package:fl_pos_app/screen/splash/screen/splash_screen.dart';
import 'package:fl_pos_app/screen/masterMenu/uom/screen/uom_screen.dart';
import 'package:fluro/fluro.dart';

class NavigateTo {
  static final routeNotFoundHandler =
      Handler(handlerFunc: (context, params) => const RouteNotFoundPage());

  static final splashRoute = AppRoute(
    '/',
    Handler(
      handlerFunc: (context, parameters) => const SplashScreen(),
    ),
    transitionDuration: const Duration(seconds: 10),
  );

  static final homeRoute = AppRoute(
    '/dashboard',
    Handler(
      handlerFunc: (context, parameters) => DashboardScreen(),
    ),
  );
  static final uomRoute = AppRoute(
    '/uom',
    Handler(
      handlerFunc: (context, parameters) => UomScreen(),
    ),
  );
  static final brandRoute = AppRoute(
    '/brand',
    Handler(
      handlerFunc: (context, parameters) => BrandScreen(),
    ),
  );
  static final categoryRoute = AppRoute(
    '/category',
    Handler(
      handlerFunc: (context, parameters) => CategoryScreen(),
    ),
  );
  static final itemRoute = AppRoute(
    '/item',
    Handler(
      handlerFunc: (context, parameters) => ItemScreenScreen(),
    ),
  );
  // static final addressByIndex = AppRoute(
  //   '/customer/:id/:index',
  //   Handler(
  //     handlerFunc: (context, Map<String, List<String>> params) {
  //       final String id = params["id"]![0];
  //       final int index = int.parse(params["index"]![0]);
  //       return CustomerScreen(
  //         id: id,
  //         index: index,
  //       );
  //     },
  //   ),
  // );
  // static final customerById = AppRoute(
  //   '/customer/:id',
  //   Handler(
  //     handlerFunc: (context, Map<String, List<String>> params) {
  //       final String id = params["id"]![0];
  //       return CustomerForm(
  //         id: id,
  //       );
  //     },
  //   ),
  // );

  // /// Primitive function to get one param detail route (i.e. id).
  // static String getDetailRoute(String parentRoute, String id) {
  //   return "$parentRoute/$id";
  // }

  static final List<AppRoute> routes = [
    homeRoute,
    splashRoute,
    uomRoute,
    brandRoute,
    categoryRoute,
    itemRoute,
  ];
}
