import 'package:flutter/services.dart';
class AndroidCommunicateHelper{

  static const channelName = "com.mmd.flutterapp/plugin";

  static const methodName = "toast";

  static const channel = MethodChannel(channelName);

  static Future<String> invokeToastMethod(String content) async{

    Map<String,String> map = {"data":content};

    String result =  await channel.invokeMethod(methodName,map);

    return result;

  }
}