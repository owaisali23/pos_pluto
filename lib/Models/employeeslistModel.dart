class EmployeeResponse {
  bool success;
  int count;
  Pagination pagination;
  List<Employee> result;

  EmployeeResponse({
    this.success,
    this.count,
    this.pagination,
    this.result,
  });

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) {
    return EmployeeResponse(
      success: json['success'],
      count: json['count'],
      pagination: Pagination.fromJson(json['pagination']),
      result: List<Employee>.from(json['result'].map((x) => Employee.fromJson(x))),
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

class Employee {
  String id;
  String name;
  String email;
  String password;
  String imageUrl;
  String provider;
  String role;
  String resetPasswordToken;
  String lastCredentialChange;
  String resetPasswordExpire;
  String emailVerificationToken;
  bool isEmailVerified;
  String createdAt;
  String updatedAt;
  String storeId;

 Employee({
    this.id,
    this.name,
    this.email,
    this.password,
    this.imageUrl,
    this.provider,
    this.role,
    this.resetPasswordToken,
    this.lastCredentialChange,
    this.resetPasswordExpire,
    this.emailVerificationToken,
    this.isEmailVerified,
    this.createdAt,
    this.updatedAt,
    this.storeId,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      imageUrl: json['imageUrl'],
      provider: json['provider'],
      role: json['role'],
      resetPasswordToken: json['resetPasswordToken'],
      lastCredentialChange: json['lastCredentialChange'],
      resetPasswordExpire: json['resetPasswordExpire'],
      emailVerificationToken: json['emailVerificationToken'],
      isEmailVerified: json['isEmailVerified'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      storeId: json['storeId'],
    );
  }
}
