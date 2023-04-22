import 'package:flutter_riverpod/flutter_riverpod.dart';

//family, autoDispose
final familyModifierProvider =
//data에 3을 넣었음
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
  //return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});
