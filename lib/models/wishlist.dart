import 'package:furniture_app/models/product.dart';

class Wishlist {
  final Product product;
  // int quantity;
  final String boardTitle;
  static List<Wishlist> wishlist = [];

  Wishlist({required this.product, required this.boardTitle});

  static void addWishlist(Product product, String boardTitle) {
    bool productExists = false;

    if (!productExists) {
      wishlist.add(Wishlist(product: product, boardTitle: boardTitle));
      print('Product added to Wishlist: ${product.name}');
    }
  }

  static void removeWishlist(Product product) {
    wishlist.removeWhere((item) => item.product.name == product.name);
    print('Product removed from Wishlist: ${product.name}');
  }

  static bool isInWishlist(Product product) {
    return wishlist.any((item) => item.product.name == product.name);
  }
}
