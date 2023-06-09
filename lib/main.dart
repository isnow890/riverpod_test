import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/riverpod/provider_observer.dart';
import 'package:riverpod_test/screen/home_screen.dart';

void main() {
  //ProviderScope 추가해야함
  runApp(ProviderScope(
      //1. 로거 추가
      observers: [Logger(),],
      child: MaterialApp(
        home: HomeScreen(),
      )));
}
