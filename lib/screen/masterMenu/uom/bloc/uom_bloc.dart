import 'package:equatable/equatable.dart';
import 'package:fl_pos_app/screen/masterMenu/uom/data/uom_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_pos_app/screen/masterMenu/uom/data/uom.dart';

part 'uom_event.dart';
part 'uom_state.dart';

class UomBloc extends Bloc<UomEvent, UomState> {
  UomBloc() : super(const UomState()) {
    on<UomEvent>((event, emit) async {
      if (event is LoadUom) {
        emit(const UomState(isLoading: true));
        UomState uomState = await _getUomList(event, state);
        emit(uomState);
      }
    });
  }

  Future<UomState> _getUomList(LoadUom event, UomState state) async {
    try {
      List<Uom> listUom = await UomApi.findAll();
      return state.copyWith(listUom: listUom, isLoading: false);
    } catch (e) {
      return state.copyWith(isLoading: false);
    }
  }
}
