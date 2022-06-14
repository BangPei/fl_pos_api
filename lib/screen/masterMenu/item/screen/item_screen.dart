import 'package:fl_pos_app/utils/base_template.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

// ignore: must_be_immutable
class ItemScreenScreen extends BaseTemplate {
  ItemScreenScreen({Key? key}) : super(key: key, title: "List Barang");
  @override
  State<StatefulWidget> createState() => ItemScreenScreenState();
}

class ItemScreenScreenState extends BaseTemplateState<ItemScreenScreen> {
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
