// modules/shop_app/model/Home_model/home_model.dart
class ProductListModel {
//************************************** */
  final List<ProductModel> products;

  ProductListModel({required this.products});
//************************************** */
  factory ProductListModel.fromJson(List<dynamic> jsonList) {
    return ProductListModel(
      products: jsonList
          .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
//************************************** */

class ProductModel {
  final int? id;
  final String? title;
  final double? price;
  final double? oldPrice;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  ProductModel({
     this.id,
     this.title,
     this.price,
     this.oldPrice,
     this.description,
     this.category,
     this.image,
     this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'] != null ? json['title'] : null,
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      oldPrice: json['oldPrice'] != null ? (json['oldPrice'] as num).toDouble() : null,
      description: json['description'] != null ? json['description'] : null,
      category: json['category'],
      image: json['image'],
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    );
  }
}

class Rating {
  final double? rate;
  final int? count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'] != null ? (json['rate'] as num).toDouble() : null,
      count: json['count'] ?? 0,
    );
  }
}