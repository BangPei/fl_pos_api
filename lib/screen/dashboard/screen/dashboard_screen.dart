import 'package:fl_pos_app/utils/base_template.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

// ignore: must_be_immutable
class DashboardScreen extends BaseTemplate {
  DashboardScreen({Key? key})
      : super(key: key, title: "Dashboard", showSubtitle: false);
  @override
  State<StatefulWidget> createState() => DashboardScreenState();
}

class DashboardScreenState extends BaseTemplateState<DashboardScreen> {
  @override
  Widget body() {
    return ListView(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: const [
        Visibility(
          visible: true,
          child: ResponsiveGridRow(
            children: [],
          ),
        ),
      ],
    );
  }
}
