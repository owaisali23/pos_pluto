class productsModels {
final bool? success;
final int? count;
final Pagination? pagination;
final List<Result>? result;
const productsModels({this.success , this.count , this.pagination , this.result });
productsModels copyWith({bool? success, int? count, Pagination? pagination, List<Result>? result}){
return productsModels(
            success:success ?? this.success,
count:count ?? this.count,
pagination:pagination ?? this.pagination,
result:result ?? this.result
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'success': success,
'count': count,
'pagination': pagination?.toJson(),
'result': result?.map<Map<String,dynamic>>((data)=> data.toJson()).toList()
    };
}

static productsModels fromJson(Map<String , Object?> json){
    return productsModels(
            success:json['success'] == null ? null : json['success'] as bool,
count:json['count'] == null ? null : json['count'] as int,
pagination:json['pagination'] == null ? null : Pagination.fromJson(json['pagination']  as Map<String,Object?>),
result:json['result'] == null ? null : (json['result'] as List).map<Result>((data)=> Result.fromJson(data  as Map<String,Object?>)).toList()
    );
}

@override
String toString(){
    return '''productsModels(
                success:$success,
count:$count,
pagination:${pagination.toString()},
result:${result.toString()}
    ) ''';
}

@override
bool operator ==(Object other){
    return other is productsModels && 
        other.runtimeType == runtimeType &&
        other.success == success && 
other.count == count && 
other.pagination == pagination && 
other.result == result;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                success, 
count, 
pagination, 
result
    );
}
    
}
      
      
class Result {
final String? id;
final String? name;
final int? price;
final dynamic imageUrl;
final String? createdAt;
final String? updatedAt;
final String? categoryName;
final Details? details;
const Result({this.id , this.name , this.price , this.imageUrl , this.createdAt , this.updatedAt , this.categoryName , this.details });
Result copyWith({String? id, String? name, int? price, dynamic? imageUrl, String? createdAt, String? updatedAt, String? categoryName, Details? details}){
return Result(
            id:id ?? this.id,
name:name ?? this.name,
price:price ?? this.price,
imageUrl:imageUrl ?? this.imageUrl,
createdAt:createdAt ?? this.createdAt,
updatedAt:updatedAt ?? this.updatedAt,
categoryName:categoryName ?? this.categoryName,
details:details ?? this.details
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'id': id,
'name': name,
'price': price,
'imageUrl': imageUrl,
'createdAt': createdAt,
'updatedAt': updatedAt,
'categoryName': categoryName,
'details': details?.toJson()
    };
}

static Result fromJson(Map<String , Object?> json){
    return Result(
            id:json['id'] == null ? null : json['id'] as String,
name:json['name'] == null ? null : json['name'] as String,
price:json['price'] == null ? null : json['price'] as int,
imageUrl:json['imageUrl'] as dynamic,
createdAt:json['createdAt'] == null ? null : json['createdAt'] as String,
updatedAt:json['updatedAt'] == null ? null : json['updatedAt'] as String,
categoryName:json['categoryName'] == null ? null : json['categoryName'] as String,
details:json['details'] == null ? null : Details.fromJson(json['details']  as Map<String,Object?>)
    );
}

@override
String toString(){
    return '''Result(
                id:$id,
name:$name,
price:$price,
imageUrl:$imageUrl,
createdAt:$createdAt,
updatedAt:$updatedAt,
categoryName:$categoryName,
details:${details.toString()}
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Result && 
        other.runtimeType == runtimeType &&
        other.id == id && 
other.name == name && 
other.price == price && 
other.imageUrl == imageUrl && 
other.createdAt == createdAt && 
other.updatedAt == updatedAt && 
other.categoryName == categoryName && 
other.details == details;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                id, 
name, 
price, 
imageUrl, 
createdAt, 
updatedAt, 
categoryName, 
details
    );
}
    
}
      
      
class Details {
final String? type;
final String? year;
final String? brand;
final String? modal;
const Details({this.type , this.year , this.brand , this.modal });
Details copyWith({String? type, String? year, String? brand, String? modal}){
return Details(
            type:type ?? this.type,
year:year ?? this.year,
brand:brand ?? this.brand,
modal:modal ?? this.modal
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'type': type,
'year': year,
'brand': brand,
'modal': modal
    };
}

static Details fromJson(Map<String , Object?> json){
    return Details(
            type:json['type'] == null ? null : json['type'] as String,
year:json['year'] == null ? null : json['year'] as String,
brand:json['brand'] == null ? null : json['brand'] as String,
modal:json['modal'] == null ? null : json['modal'] as String
    );
}

@override
String toString(){
    return '''Details(
                type:$type,
year:$year,
brand:$brand,
modal:$modal
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Details && 
        other.runtimeType == runtimeType &&
        other.type == type && 
other.year == year && 
other.brand == brand && 
other.modal == modal;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                type, 
year, 
brand, 
modal
    );
}
    
}
      
      
class Pagination {
final int? currentPage;
final int? totalPages;
final int? limit;
const Pagination({this.currentPage , this.totalPages , this.limit });
Pagination copyWith({int? currentPage, int? totalPages, int? limit}){
return Pagination(
            currentPage:currentPage ?? this.currentPage,
totalPages:totalPages ?? this.totalPages,
limit:limit ?? this.limit
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'currentPage': currentPage,
'totalPages': totalPages,
'limit': limit
    };
}

static Pagination fromJson(Map<String , Object?> json){
    return Pagination(
            currentPage:json['currentPage'] == null ? null : json['currentPage'] as int,
totalPages:json['totalPages'] == null ? null : json['totalPages'] as int,
limit:json['limit'] == null ? null : json['limit'] as int
    );
}

@override
String toString(){
    return '''Pagination(
                currentPage:$currentPage,
totalPages:$totalPages,
limit:$limit
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Pagination && 
        other.runtimeType == runtimeType &&
        other.currentPage == currentPage && 
other.totalPages == totalPages && 
other.limit == limit;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                currentPage, 
totalPages, 
limit
    );
}
    
}
      
      
  
     