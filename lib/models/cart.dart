class CartModels {
  CartModels({
    required this.idCart,
    required this.idUser,
    required this.image,
    required this.color,
    required this.gender,
    required this.jumlahBarang,
    required this.price,
    required this.caption,
    required this.idProduct,
    required this.priceAwal,
    required this.type,
    required this.brand,
    required this.size,
  });

  final String idCart;
  final String idUser;
  final List<String> image;
  final String color;
  final String gender;
  final int jumlahBarang;
  final int price;
  final String caption;
  final int idProduct;
  final int priceAwal;
  final String type;
  final String brand;
  final int size;

//Get
  factory CartModels.fromMap(Map<dynamic, dynamic> map) {
    print('masuk model cartModels $map');
    return CartModels(
      idCart: map['idCart'] ?? '',
      idUser: map['idUser'] ?? '',
      image: List<String>.from(map['image'] ?? []),
      color: map['color'] ?? '',
      gender: map['gender'] ?? '',
      jumlahBarang: map['jumlahBarang'] ?? 0,
      price: map['price'] ?? 0,
      caption: map['caption'] ?? '',
      idProduct: map['idProduct'] ?? 0,
      priceAwal: map['priceAwal'] ?? 0,
      type: map['type'] ?? '',
      brand: map['brand'] ?? '',
      size: map['size'] ?? '',
    );
  }

  //Sent to Firebase
  Map<String, dynamic> toMap() {
    return {
      'idCart': idCart,
      'idUser': idUser,
      'image': image,
      'color': color,
      'gender': gender,
      'jumlahBarang': jumlahBarang,
      'price': price,
      'caption': caption,
      'idProduct': idProduct,
      'priceAwal': priceAwal,
      'type': type,
      'brand': brand,
      'size': size
    };
  }
}
