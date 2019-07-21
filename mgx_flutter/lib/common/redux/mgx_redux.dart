import 'package:mgx_flutter/common/model/User.dart';
import 'package:mgx_flutter/common/redux/user_redux.dart';

class MgxState {
  //用户信息
  User userInfo;

  MgxState({this.userInfo});

}

//创建 Reducer
MgxState appReducer(MgxState state, action) {
  return MgxState(
    //通过自定义的UserReducer 将 MgxState 内的userInfo 和action 关联在一起
    userInfo: UserReducer(state.userInfo,action),
  );
}
