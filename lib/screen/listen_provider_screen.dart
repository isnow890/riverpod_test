import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/layout/default_layout.dart';

import '../riverpod/listen_provider.dart';

//StateFulWidget의 ConsumerWidget 형태임.

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(
        length: 10,
        vsync: this,
        //최초 시작 인덱스 지정하는 부분
        initialIndex: ref.read(
          listenProvider,
        ));
  }

  @override
  Widget build(BuildContext context) {
    //ref가 글로벌로 존재함.
    //riverPod의 listen은 dispose를 사용할 필요가 없다.
    ref.listen<int>(listenProvider, (previous, next) {
      //TabController의 값을 변경해줌.
      if (previous != next) {
        controller.animateTo(
          next,
        );
      }
    });

    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(listenProvider.notifier)
                        .update((state) => state == 10 ? 10 : state + 1);
                  },
                  child: Text('다음')),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(listenProvider.notifier)
                        .update((state) => state == 0 ? 0 : state - 1);
                  },
                  child: Text('뒤로')),
            ],
          ),
        ),
      ),
    );
  }
}
