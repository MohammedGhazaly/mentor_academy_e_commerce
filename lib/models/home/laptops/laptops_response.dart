import 'package:mentor_academy_e_commerce/models/home/laptops/product_model.dart';

class LaptopsResponse {
  String? status;
  String? message;
  List<ProductModel>? product;

  LaptopsResponse({this.status, this.message, this.product});

  LaptopsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['product'] != null) {
      product = <ProductModel>[];
      json['product'].forEach((v) {
        product!.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
