import 'package:mentor_academy_e_commerce/models/cart/cart_model/product.dart';

abstract class GetCartStates {}

class GetCartInitial implements GetCartStates {}

class GetCartLoading implements GetCartStates {}

class GetCartFailure implements GetCartStates {
  final String? errorMessage;

  GetCartFailure({this.errorMessage});
}

class GetCartSuccess implements GetCartStates {
  final List<Product> products;

  GetCartSuccess({required this.products});
}
// Getting Cart products states
