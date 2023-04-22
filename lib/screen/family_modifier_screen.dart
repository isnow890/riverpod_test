import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/layout/default_layout.dart';
import 'package:riverpod_test/riverpod/family_modifier_provider.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //future provider와 달리 생성자로 넣어야함.
    final state = ref.watch(familyModifierProvider(5));
    return DefaultLayout(
      title: 'FamilyModifierScreen',
      body: Center(
        child:
          state.when(
              data: (data) => Text(data.toString()),
              error: (err, stack) => Text(err.toString()),
              loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
