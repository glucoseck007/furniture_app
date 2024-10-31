class LivingRoom {
  final String name;
  final String description;
  final String price;
  final List<String> subcategories;

  LivingRoom({
    required this.name,
    this.description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    required this.price,
    required this.subcategories,
  });

  @override
  String toString() {
    return 'LivingRoom(name: $name, description: $description, price: $price, subcategories: $subcategories)';
  }
}
