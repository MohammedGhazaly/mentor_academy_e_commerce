part of 'favorite_cubit.dart';

abstract class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteFailure extends FavoriteState {
  final String errorMessage;

  FavoriteFailure({required this.errorMessage});
}

final class FavoriteSuccess extends FavoriteState {
  final List<Product> products;

  FavoriteSuccess({required this.products});
}
