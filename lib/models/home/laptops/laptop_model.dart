class LaptopModel {
  String? sId;
  String? status;
  String? category;
  String? name;
  num? price;
  String? description;
  String? image;
  List<String>? images;
  String? company;
  num? countInStock;
  num? iV;
  num? sales;

  LaptopModel(
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

  LaptopModel.fromJson(Map<String, dynamic> json) {
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
}
