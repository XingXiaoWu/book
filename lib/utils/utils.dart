import 'package:book/constants/constants.dart';
import 'package:flutter/foundation.dart';

// 只在调试模式打印
void trueDebugPrint(dynamic message){
  if(Constants.isDebug){
    print('$message');
  }
}