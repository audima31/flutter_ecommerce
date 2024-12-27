class Products {
  //Constructor
  Products({
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
  final double price;
  final String type;
  final bool _isFav = false;

  bool get isFav => _isFav;
}
