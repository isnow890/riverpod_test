class ShoppingItemModel {
  final String name;
  final int quantity;
  final bool hasBought;
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });


  ShoppingItemModel copyWith(
      {String? name, int? quantity, bool? hasBought, bool? isSpicy}) {

    return ShoppingItemModel(
        //입력된 값만 새로운 값을 부여하기 위하여.
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        hasBought: hasBought ?? this.hasBought,
        isSpicy: isSpicy ?? this.isSpicy);
  }
}
