part of 'uom_bloc.dart';

class UomState extends Equatable {
  final List<Uom>? listUom;
  final bool? isLoading;

  const UomState({this.isLoading, this.listUom});

  UomState copyWith({listUom, isLoading}) {
    return UomState(
      listUom: listUom ?? this.listUom,
      isLoading: isLoading ?? this.isLoading ?? false,
    );
  }

  @override
  List<Object?> get props => [isLoading, listUom];
}
