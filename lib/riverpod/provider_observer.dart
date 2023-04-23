import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver{

  //Provider를 업데이트 했을때
  @override
  //provider -> 프로바이더
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    // TODO: implement didUpdateProvider
    print('[Provider Updated] provider : $provider / pv : $previousValue / nv : $newValue');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  //Provider를 추가하면 실행됨
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    print('[Provider Added] provider : $provider / value : ${value}');
    // TODO: implement didAddProvider
    super.didAddProvider(provider, value, container);
  }

  //Provider가 삭제 되었을때
  @override
  void didDisposeProvider(ProviderBase<Object?> provider,  ProviderContainer container) {
    print('[Provider Disposed] provider : $provider');
    // TODO: implement didDisposeProvider
    super.didDisposeProvider(provider, container);
  }
}