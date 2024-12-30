class ProductsModels {
  // Constructor
  ProductsModels({
    required this.id,
    required this.brand,
    required this.caption,
    required this.gender,
    required this.image,
    required this.price,
    required this.type,
  });

  final int id;
  final String brand;
  final String caption;
  final String gender;
  final List<String> image;
  final int price;
  final String type;

  // Factory constructor for creating a new product from a Map
  factory ProductsModels.fromMap(Map<String, dynamic> map) {
    print('Products Models -------------');
    return ProductsModels(
      id: map['id'],
      brand: map['brand'],
      caption: map['caption'],
      gender: map['gender'],
      image: List<String>.from(
          map['image'] ?? []), // Ensure image is a list of strings
      price: map['price'],
      type: map['type'],
    );
  }
}
