class ProductResponse {
  bool success;
  int count;
  Pagination pagination;
  List<ProductItem> result;

  ProductResponse({
    this.success,
    this.count,
    this.pagination,
    this.result,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      success: json['success'],
      count: json['count'],
      pagination: Pagination.fromJson(json['pagination']),
      result: List<ProductItem>.from(json['result'].map((x) => ProductItem.fromJson(x))),
    );
  }
}

class Pagination {
  int currentPage;
  int totalPages;
  int limit;

  Pagination({
    this.currentPage,
    this.totalPages,
    this.limit,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      limit: json['limit'],
    );
  }
}

class ProductItem {
  String id;
  int count;
  int price;
  int warranty;
  String createdAt;
  String updatedAt;
  String storeId;
  String productId;
  Product product;

  ProductItem({
    this.id,
    this.count,
    this.price,
    this.warranty,
    this.createdAt,
    this.updatedAt,
    this.storeId,
    this.productId,
    this.product,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      id: json['id'],
      count: json['count'],
      price: json['price'],
      warranty: json['warranty'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      storeId: json['storeId'],
      productId: json['productId'],
      product: Product.fromJson(json['product']),
    );
  }
}

class Product {
  String id;
  String name;
  String imageUrl;
  String createdAt;
  String updatedAt;
  String categoryName;
  ProductDetails details;

  Product({
    this.id,
    this.name,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.categoryName,
    this.details,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      categoryName: json['categoryName'],
      details: ProductDetails.fromJson(json['details']),
    );
  }
}

class ProductDetails {
  String type;
  String year;
  String brand;
  String modal;

  ProductDetails({
    this.type,
    this.year,
    this.brand,
    this.modal,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      type: json['type'],
      year: json['year'],
      brand: json['brand'],
      modal: json['modal'],
    );
  }
}
