import 'package:furniture_app/models/product.dart';

class Cart {
  final Product product;
  int quantity;
  static List<Cart> carts = [];

  Cart({required this.product, required this.quantity});

  static void addCart(Product product) {
    bool productExists = false;
    for (var cartItem in carts) {
      if (cartItem.product.name == product.name) {
        cartItem.quantity += 1;
        print(
            'Product quantity increased: ${cartItem.product.name}, Quantity: ${cartItem.quantity}');
        productExists = true;
        break;
      }
    }

    if (!productExists) {
      carts.add(Cart(product: product, quantity: 1));
      print('Product added to cart: ${product.name}');
    }
  }

  static void removeCart(Product product) {
    for (var cartItem in carts) {
      if (cartItem.product.name == product.name) {
        if (cartItem.quantity > 1) {
          cartItem.quantity--; // Decrease the quantity by 1
          print(
              'Decreased quantity of ${product.name} to ${cartItem.quantity}');
        } else {
          carts.remove(cartItem); // Remove the item if quantity is 1
          print('Product removed from cart: ${product.name}');
        }
        break; // Exit the loop after finding the product
      }
    }
  }

  static void updateQuantity(Product product, int quantity) {
    for (var cartItem in carts) {
      if (cartItem.product.name == product.name) {
        if (quantity > 0) {
          cartItem.quantity = quantity;
          print(
              'Product quantity updated: ${cartItem.product.name}, New Quantity: $quantity');
        } else {
          removeCart(product);
        }
        break;
      }
    }
  }

  static int getTotalItems() {
    return carts.fold(0, (total, cartItem) => total + cartItem.quantity);
  }

  static bool isInCart(Product product) {
    return carts.any((cartItem) => cartItem.product.name == product.name);
  }
}
