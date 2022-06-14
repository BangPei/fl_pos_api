import 'package:fl_pos_app/utils/base_template.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

// ignore: must_be_immutable
class BrandScreen extends BaseTemplate {
  BrandScreen({Key? key}) : super(key: key, title: "List Merek");
  @override
  State<StatefulWidget> createState() => BrandScreenState();
}

class BrandScreenState extends BaseTemplateState<BrandScreen> {
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
