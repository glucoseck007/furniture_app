import 'dart:ui';
import 'package:furniture_app/core/constants/app_image.dart';
import 'package:furniture_app/core/theme/app_color.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String image;
  final String? category;
  final int? rating;
  final String type; // New attribute for product type
  final Color color; // New attribute for product color
  late List<String>? subcategories;

  Product({
    required this.rating,
    required this.name,
    this.description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    required this.price,
    required this.image,
    this.category,
    required this.type, // Initialize type in constructor
    required this.color, // Initialize color in constructor
    this.subcategories = const [
      'Living Room',
      'Decorative Lights',
      'Beds',
      'Sofa',
      'Tables',
      'Chairs',
      'Cupboard',
      'Decor',
    ],
  });

  static List<Product> getBeds() {
    List<Product> beds = [];

    beds.add(Product(
      rating: 4,
      name: 'Single Bed',
      price: 294,
      image: AppImage.singleBed,
      category: 'Bedroom',
      type: 'Bed', // Added type
      color: AppColors.filter1, // Added color
    ));
    beds.add(Product(
      rating: 4,
      name: 'Green Bed',
      price: 285,
      image: AppImage.greenBed,
      category: 'Bedroom',
      type: 'Bed',
      color: AppColors.filter2,
    ));
    beds.add(Product(
      rating: 4,
      name: 'Brown Bed',
      price: 282,
      image: AppImage.brownBed,
      category: 'Bedroom',
      type: 'Bed',
      color: AppColors.filter3,
    ));
    beds.add(Product(
      rating: 4,
      name: 'King Bed',
      price: 405,
      image: AppImage.kingBed,
      category: 'Bedroom',
      type: 'Bed',
      color: AppColors.filter4,
    ));
    beds.add(Product(
      rating: 4,
      name: 'Stylish Bed',
      price: 120,
      image: AppImage.stylishBed,
      category: 'Bedroom',
      type: 'Bed',
      color: AppColors.filter5,
    ));
    beds.add(Product(
      rating: 4,
      name: 'Full Bed',
      price: 257,
      image: AppImage.fullBed,
      category: 'Bedroom',
      type: 'Bed',
      color: AppColors.filter6,
    ));

    return beds;
  }

  static List<Product> getNewCollections() {
    List<Product> newCollections = [];

    newCollections.add(Product(
      rating: 4,
      image: AppImage.aluminumChair,
      name: 'Aluminum Chair',
      price: 120.00,
      type: 'Chair', // Added type
      color: AppColors.filter1, // Added color
    ));

    newCollections.add(Product(
      rating: 4,
      image: AppImage.stylishChair,
      name: 'Stylish Chair',
      price: 120.00,
      type: 'Chair',
      color: AppColors.filter2,
    ));

    return newCollections;
  }

  static List<Product> getSofas() {
    List<Product> sofas = [];

    sofas.add(Product(
      rating: 4,
      name: 'Luxe Lounge Sofa',
      price: 294,
      image: AppImage.luxeSofa,
      type: 'Sofa', // Added type
      color: AppColors.filter3, // Added color
    ));
    sofas.add(Product(
      rating: 4,
      name: 'Contemporary Sofa',
      price: 285,
      image: AppImage.contemporary,
      type: 'Sofa',
      color: AppColors.filter4,
    ));
    sofas.add(Product(
      rating: 4,
      name: 'Chesterfield Sofa',
      price: 282,
      image: AppImage.chesterfield,
      type: 'Sofa',
      color: AppColors.filter5,
    ));
    sofas.add(Product(
      rating: 4,
      name: 'Scandinavian Sofa',
      price: 405,
      image: AppImage.scandinavian,
      type: 'Sofa',
      color: AppColors.filter6,
    ));
    sofas.add(Product(
      rating: 4,
      name: 'Blue Sofa',
      price: 120,
      image: AppImage.blue,
      type: 'Sofa',
      color: AppColors.filter1,
    ));
    sofas.add(Product(
      rating: 4,
      name: 'Velvet Sofa',
      price: 257,
      image: AppImage.velvet,
      type: 'Sofa',
      color: AppColors.filter2,
    ));

    return sofas;
  }

  static List<Product> getKitchens() {
    List<Product> kitchens = [];

    kitchens.add(Product(
      rating: 4,
      name: 'Kitchen Hutch',
      price: 294,
      image: AppImage.kitchenHutch,
      type: 'Kitchen', // Added type
      color: AppColors.filter3, // Added color
    ));
    kitchens.add(Product(
      rating: 4,
      name: 'Vintage Cabinet',
      price: 285,
      image: AppImage.vintageCabinet,
      type: 'Kitchen',
      color: AppColors.filter4,
    ));
    kitchens.add(Product(
      rating: 4,
      name: 'Marble Shelving',
      price: 282,
      image: AppImage.marbleShelving,
      type: 'Kitchen',
      color: AppColors.filter5,
    ));
    kitchens.add(Product(
      rating: 4,
      name: 'Kitchen Shelving',
      price: 405,
      image: AppImage.kitchenShelving,
      type: 'Kitchen',
      color: AppColors.filter6,
    ));
    kitchens.add(Product(
      rating: 4,
      name: 'Wood Shelving',
      price: 120,
      image: AppImage.woodShelving,
      type: 'Kitchen',
      color: AppColors.filter1,
    ));
    kitchens.add(Product(
      rating: 4,
      name: 'Wooden Kitchen',
      price: 257,
      image: AppImage.woodenKitchen,
      type: 'Kitchen',
      color: AppColors.filter2,
    ));

    return kitchens;
  }

  static List<Product> getDining() {
    List<Product> dining = [];

    dining.add(Product(
      rating: 4,
      name: 'Deluxe Table',
      price: 294,
      image: AppImage.deluxe,
      type: 'Dining', // Added type
      color: AppColors.filter3, // Added color
    ));
    dining.add(Product(
      rating: 4,
      name: 'Modern Table',
      price: 285,
      image: AppImage.dmodern,
      type: 'Dining',
      color: AppColors.filter4,
    ));
    dining.add(Product(
      rating: 4,
      name: 'Modern Glass Table',
      price: 282,
      image: AppImage.modernGlass,
      type: 'Dining',
      color: AppColors.filter5,
    ));
    dining.add(Product(
      rating: 4,
      name: 'Bohemian Table',
      price: 405,
      image: AppImage.bohemian,
      type: 'Dining',
      color: AppColors.filter6,
    ));
    dining.add(Product(
      rating: 4,
      name: 'Glass Table',
      price: 120,
      image: AppImage.glass,
      type: 'Dining',
      color: AppColors.filter1,
    ));
    dining.add(Product(
      rating: 4,
      name: 'Stylish Table',
      price: 257,
      image: AppImage.dstylish,
      type: 'Dining',
      color: AppColors.filter2,
    ));

    return dining;
  }

  static List<Product> getDesks() {
    List<Product> desks = [];

    desks.add(Product(
      rating: 4,
      name: 'Classic Desktop',
      price: 294,
      image: AppImage.classic,
      type: 'Desk', // Added type
      color: AppColors.filter3, // Added color
    ));
    desks.add(Product(
      rating: 4,
      name: 'Modern Desktop',
      price: 285,
      image: AppImage.omodern,
      type: 'Desk',
      color: AppColors.filter4,
    ));
    desks.add(Product(
      rating: 4,
      name: 'Minimalist Desktop',
      price: 282,
      image: AppImage.minimalist,
      type: 'Desk',
      color: AppColors.filter5,
    ));
    desks.add(Product(
      rating: 4,
      name: 'Bronze Desktop',
      price: 405,
      image: AppImage.bronze,
      type: 'Desk',
      color: AppColors.filter6,
    ));
    desks.add(Product(
      rating: 4,
      name: 'Stylish Desktop',
      price: 120,
      image: AppImage.ostylish,
      type: 'Desk',
      color: AppColors.filter1,
    ));
    desks.add(Product(
      rating: 4,
      name: 'White Desktop',
      price: 257,
      image: AppImage.owhite,
      type: 'Desk',
      color: AppColors.filter2,
    ));

    return desks;
  }

  static List<Product> getOffers() {
    List<Product> desks = [];

    desks.add(Product(
      rating: 4,
      name: 'Luxe Lounge Sofa',
      price: 294,
      image: AppImage.luxeSofa,
      type: 'Offer', // Added type
      color: AppColors.filter3, // Added color
    ));
    desks.add(Product(
      rating: 4,
      name: 'Stylish Clock',
      price: 285,
      image: AppImage.clock,
      type: 'Offer',
      color: AppColors.filter4,
    ));
    desks.add(Product(
      rating: 4,
      name: 'Serenity Nightstand',
      price: 282,
      image: AppImage.nightstandT,
      type: 'Offer',
      color: AppColors.filter5,
    ));
    desks.add(Product(
      rating: 4,
      name: 'Stylish Sofa',
      price: 405,
      image: AppImage.chesterfield,
      type: 'Offer',
      color: AppColors.filter6,
    ));
    desks.add(Product(
      rating: 4,
      name: 'White Organizer',
      price: 120,
      image: AppImage.whiteOrganizer,
      type: 'Offer',
      color: AppColors.filter1,
    ));
    desks.add(Product(
      rating: 4,
      name: 'Table Centerpiece',
      price: 257,
      image: AppImage.centerpiece,
      type: 'Offer',
      color: AppColors.filter2,
    ));

    return desks;
  }

  static List<Product> getBestSeller() {
    List<Product> best = [];

    best.add(Product(
      rating: 4,
      name: 'Green Bed',
      price: 285,
      image: AppImage.greenBed,
      type: 'Best Seller', // Added type
      color: AppColors.filter3, // Added color
    ));
    best.add(Product(
      rating: 4,
      name: 'Kitchen Cart',
      price: 40,
      image: AppImage.kitchenCart,
      type: 'Best Seller',
      color: AppColors.filter4,
    ));
    best.add(Product(
      rating: 4,
      name: 'Kitchen Shelving',
      price: 15,
      image: AppImage.kitchenShelving,
      type: 'Best Seller',
      color: AppColors.filter5,
    ));
    best.add(Product(
      rating: 4,
      name: 'Kitchen Hutch',
      price: 620,
      image: AppImage.kitchenHutch,
      type: 'Best Seller',
      color: AppColors.filter6,
    ));

    return best;
  }
}
