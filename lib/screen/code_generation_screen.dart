import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/riverpod/code_generation_provider.dart';

import '../layout/default_layout.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //g.dart 안에 있는 프로바이더
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('State1 : $state1'),
          state2.when(
            //데이터가 들어있을때
            data: (data) {
              return Text(
                'State2 : ${data.toString()}',
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
          state3.when(
            //데이터가 들어있을때
            data: (data) {
              return Text(
                'State3 : ${data.toString()}',
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
