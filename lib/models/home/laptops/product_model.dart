class ProductModel {
  String? sId;
  String? status;
  String? category;
  String? name;
  double? price;
  String? description;
  String? image;
  List<String>? images;
  String? company;
  int? countInStock;
  int? iV;
  int? sales;

  ProductModel(
      {this.sId,
      this.status,
      this.category,
      this.name,
      this.price,
      this.description,
      this.image,
      this.images,
      this.company,
      this.countInStock,
      this.iV,
      this.sales});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    category = json['category'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    images = json['images'].cast<String>();
    company = json['company'];
    countInStock = json['countInStock'];
    iV = json['__v'];
    sales = json['sales'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['status'] = this.status;
    data['category'] = this.category;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image'] = this.image;
    data['images'] = this.images;
    data['company'] = this.company;
    data['countInStock'] = this.countInStock;
    data['__v'] = this.iV;
    data['sales'] = this.sales;
    return data;
  }
}
