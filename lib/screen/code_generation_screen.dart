import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/riverpod/code_generation_provider.dart';

import '../layout/default_layout.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    //g.dart 안에 있는 프로바이더
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(number1: 10, number2: 20));

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
          //해당 부분을 Consumer 위젯을 사용하면 이부분에서 변경사항이 있다면 상위 부분 재 빌드가 아니라 이부분만 재빌드가 됨.
          //렌더링 효율이 좋아짐.
          Consumer(
            builder: (context, ref, child) {
              final state5 = ref.watch(gStateNotifierProvider);
              return Row(
                children: [
                  Text('State5: $state5'),
                  //아래의 child 부분을 가져올 수 있음.
                  //새로 렌더링하는 요소가 부분적일때 child에 state5에서도 한번만 실행되면 되는 위젯들을 밖에 빼놓고 안에서 재실행되면서 붙여쓸수 있게끔 기능 제공함.
                  child!,
                ],
              );
            },
            child: Text('Hello'),
          ),
          // _StateFiveWidget(),
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

//부분적으로 빌드하고 싶을때. (Consumer 없이 사용할때)
class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);
    return Text('State4 : $state5');
  }
}
