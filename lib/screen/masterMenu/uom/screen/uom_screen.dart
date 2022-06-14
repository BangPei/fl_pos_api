import 'package:fl_pos_app/screen/masterMenu/uom/bloc/uom_bloc.dart';
import 'package:fl_pos_app/screen/masterMenu/uom/data/uom_datasource.dart';
import 'package:fl_pos_app/utils/base_template.dart';
import 'package:fl_pos_app/widget/card_template.dart';
import 'package:fl_pos_app/widget/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:responsive_grid/responsive_grid.dart';

// ignore: must_be_immutable
class UomScreen extends BaseTemplate {
  UomScreen({Key? key}) : super(key: key, title: "List Satuan");
  @override
  State<StatefulWidget> createState() => UomScreenState();
}

class UomScreenState extends BaseTemplateState<UomScreen> {
  // final List<String> __columns = [
  //   "No",
  //   "Satuan",
  //   "Deskripsi",
  //   "Status",
  //   "Aksi",
  // ];
  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      title: 'Id',
      field: 'id',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'Satuan',
      field: 'name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Deskripsi',
      field: 'description',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Status',
      field: 'isvisible',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
        title: 'Aksi',
        field: 'action',
        type: PlutoColumnType.text(),
        renderer: (plutoContext) {
          return const Icon(FontAwesomeIcons.eye);
        }),
  ];
  late final PlutoGridStateManager stateManager;
  @override
  void initState() {
    context.read<UomBloc>().add(LoadUom());
    super.initState();
  }

  @override
  Widget body() {
    return BlocBuilder<UomBloc, UomState>(
      builder: (context, state) {
        return (state.isLoading ?? true)
            ? const Center(child: LoadingScreen())
            : CardTemplate(
                title: widget.title,
                content: ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xl: 12,
                      child: SizedBox(
                        height: 150,
                        child: PlutoGrid(
                          columns: columns,
                          rows: (state.listUom ?? []).map((e) {
                            return PlutoRow(cells: {
                              'id': PlutoCell(value: e.id),
                              'name': PlutoCell(value: e.name),
                              'description': PlutoCell(value: e.description),
                              'isvisible': PlutoCell(
                                  value: (e.visible ?? false)
                                      ? "Aktif"
                                      : "Tidak Aktif"),
                              'action': PlutoCell(),
                            });
                          }).toList(),
                          onLoaded: (PlutoGridOnLoadedEvent event) {
                            stateManager = event.stateManager;
                          },
                          onChanged: (PlutoGridOnChangedEvent event) {
                            // ignore: avoid_print
                            print(event);
                          },
                          configuration: const PlutoGridConfiguration(
                            enableColumnBorder: true,
                          ),
                        ),
                      ),
                      // PaginatedDataTable(
                      //   showCheckboxColumn: false,
                      //   columns: __columns.map((e) {
                      //     return DataColumn(
                      //       label: Flexible(
                      //         child: Text(
                      //           e.toUpperCase(),
                      //           textAlign: TextAlign.center,
                      //           overflow: TextOverflow.ellipsis,
                      //           style: const TextStyle(
                      //             color: Colors.black,
                      //             fontWeight: FontWeight.bold,
                      //             fontSize: 15,
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   }).toList(),
                      //   availableRowsPerPage: const [5, 10, 20],
                      //   rowsPerPage: 10,
                      //   source: UomDataSource(
                      //     listUom: state.listUom ?? [],
                      //     onViewRowSelect: (index) {},
                      //   ),
                      // ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
