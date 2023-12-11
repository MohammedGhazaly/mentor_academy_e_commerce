part of 'delete_item_cart_cubit.dart';

@immutable
sealed class DeleteItemCartState {}

final class DeleteItemCartInitial extends DeleteItemCartState {}

class DeleteCartLoading implements DeleteItemCartState {}

class DeleteCartFailure implements DeleteItemCartState {
  final String? errorMessage;

  DeleteCartFailure({this.errorMessage});
}

class DeleteCartSuccess implements DeleteItemCartState {}
