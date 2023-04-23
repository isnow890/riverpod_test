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
    final state4 = ref.watch(gStateMultiplyProvider(number1: 10, number2: 20));
    final state5 = ref.watch(gStateNotifierProvider);
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
          Text('State4 : $state4'),
          Text('State4 : $state5'),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(gStateNotifierProvider.notifier).increment();
                  },
                  child: Text('Increment')),
              ElevatedButton(
                  onPressed: () {
                    ref.read(gStateNotifierProvider.notifier).decrement();
                  },
                  child: Text('Decrement')),
            ],
          ),
          //invalidate()
          //유효하지 않게 하다
          //초기화 시키는 기능임.
          ElevatedButton(
              onPressed: () {
                ref.invalidate(gStateNotifierProvider);
              },
              child: Text('InValidate'))
        ],
      ),
    );
  }
}
