//임포트 해야함.
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 Provider를 사용할지 결정할 고민 할 필요 없도록
// Provider,FutureProvider, StreamProvider
// StateNotifierProvider

//기존방식
final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

//코드 제너레이션 방식
@riverpod
//input 파라메터를 앞글자 대문자
String gState(GStateRef ref){
  return 'Hello Code Generation';
}
//위와 같이 메소드 생성하고 flutter pub run build_runner build 실행하면 코드 제너레이션 생성됨.

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async{
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

//Auto Dispose 옵션 끄기
@Riverpod(
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async{
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

// 2) Parameter -> Family 파라미터를 일반 함수처럼 사용할 수 있도록

//기존 방식 -> 파라메터를 하나만 받을수밖에 없으므로 reference type으로 생성함.
class Parameter{
  final int number1;
  final int number2;

  Parameter({required this.number1,required  this.number2});
}

final _testFamilyProvider = Provider.family<int,Parameter>((ref,parameter) => parameter.number1* parameter.number2);

//그러므로 코드 제너레이션은 어떤방식으로 이 문제를 해결했는가?
@riverpod
int gStateMultiply(GStateMultiplyRef ref, {required int number1, required int number2}){
  return number1 * number2;
}
