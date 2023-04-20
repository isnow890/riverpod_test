import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/layout/default_layout.dart';
import 'package:riverpod_test/riverpod/state_provider.dart';

//StatlessWidget -> ConsumerWidget으로 변경
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  //WidgetRef 추가됨
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //빌드 바로 밑에 watch 사용하는 경우가 대다수임.
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.toString(),
              ),
              ElevatedButton(
                onPressed: () {
                  //값 업데이트
                  ref.read(numberProvider.notifier)
                      .update((state) => state + 1);
                },
                child: Text('UP'),
              ),

              ElevatedButton(
                onPressed: () {
                  //값 업데이트할 수 있는 두번째 방법
                  ref.read(numberProvider.notifier).state = ref.read(numberProvider.notifier).state-1;

                  // ref.read(numberProvider.notifier)
                  //     .update((state) => state - 1);


                },
                child: Text('DOWN'),
              ),

              ElevatedButton(
                onPressed: () {
                  //값 업데이트
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => _NextScreen()));
                },
                child: Text('Next Screen'),
              )
            ],
          ),
        ));
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.toString(),
              ),
              ElevatedButton(
                onPressed: () {
                  //값 업데이트
                  //watch를 하고 있는 다른 위젯에서 같은 값을 공유하고 있음.
                  ref
                      .read(numberProvider.notifier)
                      .update((state) => state + 1);
                },
                child: Text('UP'),
              ),
            ],
          ),
        ));
  }
}
