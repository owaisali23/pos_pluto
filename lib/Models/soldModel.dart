class SoldProductResponse {
  bool success;
  int count;
  Pagination pagination;
  List<SoldProductItem> result;

  SoldProductResponse({
    this.success,
    this.count,
    this.pagination,
    this.result,
  });

  factory SoldProductResponse.fromJson(Map<String, dynamic> json) {
    return SoldProductResponse(
      success: json['success'],
      count: json['count'],
      pagination: Pagination.fromJson(json['pagination']),
      result: List<SoldProductItem>.from(json['result'].map((x) => SoldProductItem.fromJson(x))),
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

class SoldProductItem {
  String id;
  int count;
  int price;
  int warranty;
  String createdAt;
  String updatedAt;
  String storeId;
  String productId;
  String customerName;
  String customerPhone;
  SoldProducts product;

  SoldProductItem({
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
    this.product,
  });

  factory SoldProductItem.fromJson(Map<String, dynamic> json) {
    return SoldProductItem(
      id: json['id'],
      count: json['count'],
      price: json['price'],
      warranty: json['warranty'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      storeId: json['storeId'],
      productId: json['productId'],
      customerName: json['customerName'],
      customerPhone: json['customerPhone'],
      product: SoldProducts.fromJson(json['product']),
    );
  }
}

class SoldProducts {
  String id;
  String name;
  String imageUrl;
  String createdAt;
  String updatedAt;
  String categoryName;
  ProductDetails details;

  SoldProducts({
    this.id,
    this.name,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.categoryName,
    this.details,
  });

  factory SoldProducts.fromJson(Map<String, dynamic> json) {
    return SoldProducts(
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
