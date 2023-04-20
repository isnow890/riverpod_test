import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
        (ref) => ShoppingListNotifier());

//Notifier Provider를 위하여
//1. StateNotifier 상속
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  //super에 상태관리하고 싶은 property들 넣기.

  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
                name: '김치', quantity: 3, hasBought: false, isSpicy: true),
            ShoppingItemModel(
                name: '라면', quantity: 5, hasBought: false, isSpicy: true),
            ShoppingItemModel(
                name: '삼겹살', quantity: 10, hasBought: false, isSpicy: false),
            ShoppingItemModel(
                name: '수박', quantity: 2, hasBought: false, isSpicy: false),
            ShoppingItemModel(
                name: '카스테라', quantity: 2, hasBought: false, isSpicy: false),
          ],
        );

  void toggleHasBought({required String name}) {
    //자동으로 있음.
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy)
            : e)
        .toList();
  }
}
