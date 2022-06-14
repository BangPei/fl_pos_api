part of 'brand_bloc.dart';

abstract class BrandState extends Equatable {
  const BrandState();
  
  @override
  List<Object> get props => [];
}

class BrandInitial extends BrandState {}
