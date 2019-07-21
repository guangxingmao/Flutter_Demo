import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'common/model/User.dart';
import 'common/redux/mgx_redux.dart';
import 'common/redux/user_redux.dart';
import 'common/test/demo_user_store.dart';

void main() {
  runZoned(() {
    runApp(new FlutterReduxApp());
  }, onError: (Object obj, StackTrace stack) {
    //在onError中捕获未捕获的异常,可以作为日志上传
    print(obj);
    print(stack);
  });
}

class FlutterReduxApp extends StatelessWidget {
  // This widget is the root of your application.
  final store = new Store<MgxState>(
    appReducer,
    initialState: new MgxState(userInfo:new User("初始化")),
  );

  FlutterReduxApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return new StoreProvider(
      store: store,
      child: new StoreBuilder<MgxState>(builder: (context, store) {
        return new MaterialApp(
          home: DemoUseStorePage(),
        );
      }),
    );
  }
}

