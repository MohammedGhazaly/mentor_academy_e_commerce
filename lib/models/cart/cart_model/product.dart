class Product {
	String? id;
	String? status;
	String? category;
	String? name;
	double? price;
	String? description;
	String? image;
	List<String>? images;
	String? company;
	int? countInStock;
	int? v;
	int? sales;
	int? quantity;
	double? totalPrice;

	Product({
		this.id, 
		this.status, 
		this.category, 
		this.name, 
		this.price, 
		this.description, 
		this.image, 
		this.images, 
		this.company, 
		this.countInStock, 
		this.v, 
		this.sales, 
		this.quantity, 
		this.totalPrice, 
	});

	factory Product.fromJson(Map<String, dynamic> json) => Product(
				id: json['_id'] as String?,
				status: json['status'] as String?,
				category: json['category'] as String?,
				name: json['name'] as String?,
				price: (json['price'] as num?)?.toDouble(),
				description: json['description'] as String?,
				image: json['image'] as String?,
				images: json['images'] as List<String>?,
				company: json['company'] as String?,
				countInStock: json['countInStock'] as int?,
				v: json['__v'] as int?,
				sales: json['sales'] as int?,
				quantity: json['quantity'] as int?,
				totalPrice: (json['totalPrice'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'status': status,
				'category': category,
				'name': name,
				'price': price,
				'description': description,
				'image': image,
				'images': images,
				'company': company,
				'countInStock': countInStock,
				'__v': v,
				'sales': sales,
				'quantity': quantity,
				'totalPrice': totalPrice,
			};
}
