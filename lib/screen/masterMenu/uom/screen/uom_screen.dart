import 'package:fl_pos_app/screen/masterMenu/uom/bloc/uom_bloc.dart';
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
                showAddButton: true,
                content: ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                      lg: 12,
                      md: 12,
                      sm: 12,
                      xl: 12,
                      child: SizedBox(
                        height: 200,
                        child: PlutoGrid(
                          columns: columns,
                          rows: (state.listUom ?? []).map((e) {
                            int idx = (state.listUom ?? []).indexOf(e);
                            return PlutoRow(
                              cells: {
                                'id': PlutoCell(value: idx + 1),
                                'name': PlutoCell(value: e.name),
                                'description': PlutoCell(value: e.description),
                                'isvisible': PlutoCell(
                                    value: (e.visible ?? false)
                                        ? "Aktif"
                                        : "Tidak Aktif"),
                                'action': PlutoCell(),
                              },
                            );
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
                    )
                  ],
                ),
              );
      },
    );
  }
}
