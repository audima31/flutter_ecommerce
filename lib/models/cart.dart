class CartModels {
  //constructor

  CartModels({
    required this.brand,
    required this.caption,
    required this.color,
    required this.gender,
    required this.idCart,
    required this.idProduct,
    required this.idUser,
    required this.image,
    required this.jumlahBarang,
    required this.price,
    required this.priceAwal,
    required this.type,
  });

  final String brand;
  final String caption;
  final String color;
  final String gender;
  final String idCart;
  final int idProduct;
  final String idUser;
  final String image;
  final int jumlahBarang;
  final int price;
  final int priceAwal;
  final String type;

  factory CartModels.fromMap(Map<String, dynamic> map) {
    return CartModels(
      brand: map['brand'],
      caption: map['caption'],
      color: map['color'],
      gender: map['gender'],
      idCart: map['idCart'],
      idProduct: map['idProduct'],
      idUser: map['idUser'],
      image: map['image'],
      jumlahBarang: map['jumlahBarang'],
      price: map['price'],
      priceAwal: map['priceAwal'],
      type: map['type'],
    );
  }
}
