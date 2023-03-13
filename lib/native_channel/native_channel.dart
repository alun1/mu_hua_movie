import 'dart:ffi';

import 'package:flutter/services.dart';

class NativeChannel {
  late MethodChannel methodChannel;

  NativeChannel() {
    methodChannel = const MethodChannel('native_channel');
  }


  installApk(apkPath){
    Future<Bool?> result = methodChannel.invokeMethod<Bool>('installApk', apkPath);
    return result;
  }


}
