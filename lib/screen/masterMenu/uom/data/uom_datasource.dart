import 'package:badges/badges.dart';
import 'package:fl_pos_app/screen/masterMenu/uom/data/uom.dart';
import 'package:fl_pos_app/utils/color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef OnViewRowSelect = void Function(int index);

class UomDataSource extends DataTableSource {
  UomDataSource({
    required List<Uom> listUom,
    required this.onViewRowSelect,
  }) : _listUom = listUom;

  final List<Uom> _listUom;
  final OnViewRowSelect onViewRowSelect;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);

    if (index >= _listUom.length) {
      return null;
    }
    final e = _listUom[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(SelectableText((index + 1).toString())),
        DataCell(SelectableText(e.name ?? "satuan")),
        DataCell(SelectableText(e.description ?? "deskripsi")),
        DataCell(
          Badge(
            toAnimate: false,
            shape: BadgeShape.square,
            badgeColor:
                (e.visible ?? false) ? ColorTheme.success : Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            badgeContent: Text(
              (e.visible ?? false) ? "Aktif" : "Tidak Aktif",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        DataCell(
          Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.eye),
              iconSize: 15,
              color: ColorTheme.bluePrimary,
            ),
          ),
        ),
      ],
      onSelectChanged: (val) => onViewRowSelect(index),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _listUom.length;

  @override
  int get selectedRowCount => 0;
}
