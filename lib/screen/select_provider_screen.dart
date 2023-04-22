import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/layout/default_layout.dart';
import 'package:riverpod_test/model/shopping_item_model.dart';
import 'package:riverpod_test/riverpod/select_provider.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
    (ref) => SelectNotifier());

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    //isSpicy가 변경되었을때만 watch하고 싶을때
    //watch는 build를 재실행하고
    //listen은 build를 재실행하지 않는다.
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
ref.listen(selectProvider.select((value) => value.hasBought), (previous, next) {
  print('next : ${next}');

});


    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.toString()),
            // Text(state.name),
            // Text(state.isSpicy.toString()),
            // Text(state.hasBought.toString()),
            ElevatedButton(onPressed: (){

              //isSpicy만 변경되었을때만 빌드 하고 싶다면?
              ref.read(selectProvider.notifier).toggleIsSpicy();
            }, child: Text('Spicy Toggle')),
        ElevatedButton(onPressed: (){

          ref.read(selectProvider.notifier).toggleHasBought();
        }, child: Text('HasBought Toggle')),
          ],
        ),
      ),
    );
  }
}
