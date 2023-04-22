import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/shopping_item_model.dart';
import 'package:riverpod_test/riverpod/state_notifier_provider.dart';

//
final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {

    //Provider 안에 Watch를 사용할 수 있음

    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.all){
      return shoppingListState;
    }

    return shoppingListState.where((element) => element.isSpicy == (filterState == FilterState.spicy ? true :false)).toList();


    return [];

  },
);

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider((ref) => FilterState.all);
