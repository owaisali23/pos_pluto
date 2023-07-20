class ReturnedProductResponse {
  bool success;
  int count;
  Pagination pagination;
  List<ReturnedProduct> result;

  ReturnedProductResponse({
    this.success,
    this.count,
    this.pagination,
    this.result,
  });

  factory ReturnedProductResponse.fromJson(Map<String, dynamic> json) {
    return ReturnedProductResponse(
      success: json['success'],
      count: json['count'],
      pagination: Pagination.fromJson(json['pagination']),
      result: List<ReturnedProduct>.from(json['result'].map((x) => ReturnedProduct.fromJson(x))),
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

class ReturnedProduct {
  String id;
  int count;
  double price;
  int warranty;
  DateTime createdAt;
  DateTime updatedAt;
  String storeId;
  String productId;
  String customerName;
  String customerPhone;
  ReturnedProductDetails productDetails;

  ReturnedProduct({
    this.id,
    this.count,
    this.price,
    this.warranty,
    this.createdAt,
    this.updatedAt,
    this.storeId,
    this.productId,
    this.customerName,
    this.customerPhone,
    this.productDetails,
  });

  factory ReturnedProduct.fromJson(Map<String, dynamic> json) {
    return ReturnedProduct(
      id: json['id'],
      count: json['count'],
      price: json['price'].toDouble(),
      warranty: json['warranty'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      storeId: json['storeId'],
      productId: json['productId'],
      customerName: json['customerName'],
      customerPhone: json['customerPhone'],
      productDetails: ReturnedProductDetails.fromJson(json['product']),
    );
  }
}

class ReturnedProductDetails {
  String id;
  String name;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;
  String categoryName;
  ReturnedProductInfo details;

  ReturnedProductDetails({
    this.id,
    this.name,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.categoryName,
    this.details,
  });

  factory ReturnedProductDetails.fromJson(Map<String, dynamic> json) {
    return ReturnedProductDetails(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      categoryName: json['categoryName'],
      details: ReturnedProductInfo.fromJson(json['details']),
    );
  }
}

class ReturnedProductInfo {
  String type;
  String brand;
  String modal;
  String year;

  ReturnedProductInfo({
    this.type,
    this.brand,
    this.modal,
    this.year,
  });

  factory ReturnedProductInfo.fromJson(Map<String, dynamic> json) {
    return ReturnedProductInfo(
      type: json['type'],
      brand: json['brand'],
      modal: json['modal'],
      year: json['year'],
    );
  }
}
