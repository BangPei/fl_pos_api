import 'package:fl_pos_app/utils/base_template.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

// ignore: must_be_immutable
class CategoryScreen extends BaseTemplate {
  CategoryScreen({Key? key}) : super(key: key, title: "List Category");
  @override
  State<StatefulWidget> createState() => CategoryScreenState();
}

class CategoryScreenState extends BaseTemplateState<CategoryScreen> {
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
