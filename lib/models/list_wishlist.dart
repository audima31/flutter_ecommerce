class ListWishlistModel {
  ListWishlistModel({
    required this.idListWishlist,
    required this.idUser,
    required this.idProduct,
  });

  final String idListWishlist;
  final String idUser;
  final int idProduct;

  factory ListWishlistModel.fromMap(Map<String, dynamic> map) {
    return ListWishlistModel(
      idListWishlist: map['idListWishlist'] ?? '',
      idUser: map['idUser'] ?? '',
      idProduct: map['idProduct'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idListWishlist': idListWishlist,
      'idUser': idUser,
      'idProduct': idProduct,
    };
  }
}
