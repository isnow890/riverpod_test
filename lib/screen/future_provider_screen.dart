import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/riverpod/future_provider.dart';

import '../layout/default_layout.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue state = ref.watch(multipleFutureProvider);

    return DefaultLayout(
      title: 'FutureProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          state.when(
          //데이터가 들어있을때
            data: (data) {
              return Text(
                data.toString(),
                textAlign: TextAlign.center,
              );
            },
            //에러 일때
            error: (err, stack) {
              return Text(err.toString());
            },
            //로딩중일때
            loading: () {
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
