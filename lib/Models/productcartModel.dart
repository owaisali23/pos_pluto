class Product {
  final String name;
  final String type;
  final int price;
   int count;
  final String id;
  final String productId;
  final int warranty;
  final String imageUrl;
 // TextEditingController custname;
 // TextEditingController phone;



  Product(this.name, this.type, this.price, this.count, this.id, this.productId, this.warranty, this.imageUrl/* this.custname, this.phone*/);
   
  // Override hashCode and operator ==
  @override
  int get hashCode => name.hashCode ^ type.hashCode ^ price.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          type == other.type &&
          price == other.price;
}
