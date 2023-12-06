import 'package:mentor_academy_e_commerce/models/home/laptops/laptop_model.dart';

class LaptopsResponse {
  String? status;
  String? message;
  List<LaptopModel>? product;

  LaptopsResponse({this.status, this.message, this.product});

  LaptopsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['product'] != null) {
      product = <LaptopModel>[];
      json['product'].forEach((v) {
        product!.add(new LaptopModel.fromJson(v));
      });
    }
  }
}
