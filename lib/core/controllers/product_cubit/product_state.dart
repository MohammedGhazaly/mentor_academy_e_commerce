part of 'product_cubit.dart';

abstract class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<LaptopModel> laptops;

  ProductSuccess({required this.laptops});
}

final class ProductFailure extends ProductState {
  final String errorMessage;

  ProductFailure({required this.errorMessage});
}
