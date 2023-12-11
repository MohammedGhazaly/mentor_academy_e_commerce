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

// Add
final class AddFavoriteLoading extends FavoriteState {}

final class AddFavoriteFailure extends FavoriteState {
  final String errorMessage;

  AddFavoriteFailure({required this.errorMessage});
}

final class AddFavoriteSuccess extends FavoriteState {}
// Remove

final class RemoveFavoriteLoading extends FavoriteState {}

final class RemoveFavoriteFailure extends FavoriteState {
  final String errorMessage;

  RemoveFavoriteFailure({required this.errorMessage});
}

final class RemoveFailureSuccess extends FavoriteState {}
