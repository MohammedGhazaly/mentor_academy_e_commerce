import 'product.dart';

class CartModel {
	List<Product>? products;

	CartModel({this.products});

	factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
				products: (json['products'] as List<dynamic>?)
						?.map((e) => Product.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'products': products?.map((e) => e.toJson()).toList(),
			};
}
