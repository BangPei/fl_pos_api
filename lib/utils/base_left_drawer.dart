import 'package:fl_pos_app/router/app_router.dart';
import 'package:fl_pos_app/router/app_routers.dart';
import 'package:fl_pos_app/utils/color_theme.dart';
import 'package:fl_pos_app/widget/left_expaxion_left.dart';
import 'package:fl_pos_app/widget/left_listtile.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key, this.size, this.isAdmin}) : super(key: key);

  final double? size;
  final bool? isAdmin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      color: const Color(0xFF2C3C56),
      child: ListView(
        children: [
          InkWell(
            onTap: () => AppRouter.router.navigateTo(
                context, NavigateTo.homeRoute.route,
                transition: TransitionType.none),
            child: Container(
              height: 56,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              color: ColorTheme.primary,
              child: const Text(
                "TOKO SS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          LeftListTile(
            title: "DashBoard",
            icon: Icons.home,
            onTap: () {
              AppRouter.router.navigateTo(
                context,
                NavigateTo.homeRoute.route,
                transition: TransitionType.none,
                clearStack: true,
              );
            },
          ),
          LeftExpantionTile(
            title: "Master",
            icon: Icons.toys_outlined,
            children: [
              LeftListTile(
                title: "Barang",
                icon: Icons.production_quantity_limits,
                onTap: () {
                  AppRouter.router.navigateTo(
                    context,
                    NavigateTo.itemRoute.route,
                    transition: TransitionType.none,
                    clearStack: true,
                  );
                },
              ),
              LeftListTile(
                title: 'Kategory',
                icon: Icons.category,
                onTap: () {
                  AppRouter.router.navigateTo(
                    context,
                    NavigateTo.categoryRoute.route,
                    transition: TransitionType.none,
                    clearStack: true,
                  );
                },
              ),
              LeftListTile(
                title: 'Brand',
                icon: Icons.branding_watermark,
                onTap: () {
                  AppRouter.router.navigateTo(
                    context,
                    NavigateTo.brandRoute.route,
                    transition: TransitionType.none,
                    clearStack: true,
                  );
                },
              ),
              LeftListTile(
                title: 'Satuan',
                icon: Icons.ac_unit,
                onTap: () {
                  AppRouter.router.navigateTo(
                    context,
                    NavigateTo.uomRoute.route,
                    transition: TransitionType.none,
                    clearStack: true,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
