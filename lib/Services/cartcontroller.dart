import 'package:get/get.dart';

import '../Models/productcartModel.dart';

class CartController extends GetxController {
  final RxList<Product> selectedProducts = <Product>[].obs;

  void addToCart(Product product) {
    selectedProducts.add(product);
  }

  void removeFromCart(Product product) {
    selectedProducts.remove(product);
  }

  void updateProduct(Product product) {
    // Check if the product exists in the cart
    final existingProduct = selectedProducts.firstWhere(
      (element) => element.productId == product.productId,
      orElse: () => null,
    );

    if (existingProduct != null) {
      // If the product exists, update its count
      existingProduct.count = product.count;
    } else {
      // If the product does not exist, add it to the cart
      selectedProducts.add(product);
    }
  }

  void clearCart() {
    selectedProducts.clear();
  }
}
