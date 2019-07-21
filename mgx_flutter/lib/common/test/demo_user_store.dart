import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mgx_flutter/common/model/User.dart';
import 'package:mgx_flutter/common/redux/mgx_redux.dart';
import 'package:mgx_flutter/common/redux/user_redux.dart';
import 'package:redux/redux.dart';

class DemoUseStorePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Store<MgxState> store = StoreProvider.of<MgxState>(context);
    click() {
      store.dispatch(UpdateUserAction(User("11")));
    }

    // TODO: implement build
    return new StoreConnector<MgxState, User>(
      converter: (store) => store.state.userInfo,
      builder: (context, userInfo) {
        return new Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                userInfo.login,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red,
                    backgroundColor: Colors.blue,
                    fontSize: 20),
              ),
              RaisedButton(
                child: Text(
                    "按钮"),
                onPressed:click,
              )
            ],
          ),
          color: Colors.yellow,
          alignment: Alignment.center,
        );
      },
    );
  }
}
