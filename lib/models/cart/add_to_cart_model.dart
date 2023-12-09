class AddToCartModel {
  final String nationalId;
  final String quantity;
  final String productId;

  AddToCartModel(
      {required this.nationalId,
      required this.quantity,
      required this.productId});

  Map<String, dynamic> toJson() {
    return {
      "nationalId": nationalId,
      "quantity": quantity,
      "productId": productId,
    };
  }
}
