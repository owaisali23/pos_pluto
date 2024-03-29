import 'dart:convert';

class ProductModel {
  bool success;
  int count;
  Pagination pagination;
  List<Product> result;

  ProductModel({
    this.success,
    this.count,
    this.pagination,
    this.result,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      success: json['success'],
      count: json['count'],
      pagination: Pagination.fromJson(json['pagination']),
      result: List<Product>.from(json['result'].map((x) => Product.fromJson(x))),
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
