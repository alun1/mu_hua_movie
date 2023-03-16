//version: 5.0.2
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:io';

class TalkingDataSDK {
  static const MethodChannel _channel = MethodChannel('talkingdata_sdk_plugin');

  static Future<void> init({required String appID, required String channelID, String? custom}) async{
    return await _channel.invokeMethod('init', <String, dynamic>{
      'appID': appID,
      'channelID': channelID,
      'custom': custom
    });
  }

  static Future<String> getDeviceID() async {
    return await _channel.invokeMethod('getDeviceID');
  }

  static Future<String?> getOAID() async {
    if (Platform.isAndroid) {
      return await _channel.invokeMethod('getOAID');
    }
    return null;
  }

  static Future<void> setVerboseLogDisable() async {
    return await _channel.invokeMethod("setVerboseLogDisable");
  }

  static Future<void> backgroundSessionEnabled() async {
    return await _channel.invokeMethod("backgroundSessionEnabled");
  }

  static Future<void> onPageBegin(String pageName) async {
    return await _channel
        .invokeMethod('onPageBegin', <String, dynamic>{'pageName': pageName});
  }

  static Future<void> onPageEnd(String pageName) async {
    return await _channel
        .invokeMethod('onPageEnd', <String, dynamic>{'pageName': pageName});
  }

  static Future<void> onEvent({
    required String eventId, Map? params}) async {
    return await _channel.invokeMethod('onEvent', <String, dynamic>{
      'eventID': eventId,
      'params': params
    });
  }

  static Future<void> setGlobalKV(String key, Object value) async {
    return await _channel.invokeMethod(
        'setGlobalKV', <String, dynamic>{'key': key, 'value': value});
  }

  static Future<void> removeGlobalKV(String key) async {
    return await _channel
        .invokeMethod('removeGlobalKV', <String, dynamic>{'key': key});
  }

  static Future<void> onRegister(
      {required String profileId,
        TalkingDataProfile? profile,
        String? invitationCode}) async {
    return await _channel.invokeMethod('onRegister', <String, dynamic>{
      'profileId': profileId,
      'name': profile?.name,
      'type': profile?.type.toString().split('.')[1],
      'gender': profile?.gender.toString().split('.')[1],
      'age': profile?.age,
      'property1': profile?.property1,
      'property2': profile?.property2,
      'property3': profile?.property3,
      'property4': profile?.property4,
      'property5': profile?.property5,
      'property6': profile?.property6,
      'property7': profile?.property7,
      'property8': profile?.property8,
      'property9': profile?.property9,
      'property10': profile?.property10,
      'invitationCode': invitationCode
    });
  }

  static Future<void> onLogin({required String profileId, TalkingDataProfile? profile}) async {
    return await _channel.invokeMethod('onLogin', <String, dynamic>{
      'profileId': profileId,
      'name': profile?.name,
      'type': profile?.type.toString().split('.')[1],
      'gender': profile?.gender.toString().split('.')[1],
      'age': profile?.age,
      'property1': profile?.property1,
      'property2': profile?.property2,
      'property3': profile?.property3,
      'property4': profile?.property4,
      'property5': profile?.property5,
      'property6': profile?.property6,
      'property7': profile?.property7,
      'property8': profile?.property8,
      'property9': profile?.property9,
      'property10': profile?.property10
    });
  }

  static Future<void> onProfileUpdate(
      TalkingDataProfile profile) async {
    return await _channel.invokeMethod('onProfileUpdate', <String, dynamic>{
      'name': profile.name,
      'type': profile.type.toString().split('.')[1],
      'gender': profile.gender.toString().split('.')[1],
      'age': profile.age,
      'property1': profile.property1,
      'property2': profile.property2,
      'property3': profile.property3,
      'property4': profile.property4,
      'property5': profile.property5,
      'property6': profile.property6,
      'property7': profile.property7,
      'property8': profile.property8,
      'property9': profile.property9,
      'property10': profile.property10
    });
  }

  static Future<void> onCreateCard(
      String profile, String method, String content) async {
    return await _channel.invokeMethod('onCreateCard', <String, dynamic>{
      'profile': profile,
      'method': method,
      'content': content
    });
  }

  static Future<void> onReceiveDeepLink(String link) async {
    return await _channel
        .invokeMethod('onReceiveDeepLink', <String, dynamic>{'link': link});
  }

  static Future<void> onFavorite(String category, String content) async {
    return await _channel.invokeMethod('onFavorite',
        <String, dynamic>{'category': category, 'content': content});
  }

  static Future<void> onShare(String profile, String content) async {
    return await _channel.invokeMethod(
        'onShare', <String, dynamic>{'profile': profile, 'content': content});
  }

  static Future<void> onPunch(String profile, String punchId) async {
    return await _channel.invokeMethod(
        'onPunch', <String, dynamic>{'profile': profile, 'punchId': punchId});
  }

  static Future<void> onSearch(TalkingDataSearch searchData) async {
    return await _channel.invokeMethod('onSearch', <String, dynamic>{
      'category': searchData.category,
      'content': searchData.content,
      'itemId': searchData.itemId,
      'itemLocationId': searchData.itemLocationId,
      'destination': searchData.destination,
      'origin': searchData.origin,
      'startDate': searchData.startDate,
      'endDate': searchData.endDate
    });
  }

  static Future<void> onReservation(String profile, String reservationId,
      String category, int amount, String term) async {
    return await _channel.invokeMethod('onReservation', <String, dynamic>{
      'profile': profile,
      'reservationId': reservationId,
      'category': category,
      'amount': amount,
      'term': term
    });
  }

  static Future<void> onBooking(String profile, String bookingId,
      String category, int amount, String content) async {
    return await _channel.invokeMethod('onBooking', <String, dynamic>{
      'profile': profile,
      'bookingId': bookingId,
      'category': category,
      'amount': amount,
      'content': content
    });
  }

  static Future<void> onContact(String profile, String content) async {
    return await _channel.invokeMethod(
        'onContact', <String, dynamic>{'profile': profile, 'content': content});
  }

  static Future<void> onPlaceOrder(String profileID, TalkingDataOrder order) async {
    return await _channel.invokeMethod('onPlaceOrder', <String, dynamic>{
      'profileID': profileID,
      'orderID': order.orderID,
      'totalPrice': order.totalPrice,
      'currencyType': order.currencyType,
      'orderDetails': order._orderDetails
    });
  }

  static Future<void> onPay(
      String profile,
      String orderId,
      int amount,
      String currencyType,
      String payType,
      String itemId,
      int itemCount) async {
    return await _channel.invokeMethod('onPay', <String, dynamic>{
      'profile': profile,
      'orderId': orderId,
      'amount': amount,
      'currencyType': currencyType,
      'payType': payType,
      'itemId': itemId,
      'itemCount': itemCount
    });
  }

  static Future<void> onLearn(
      String profile, String course, int begin, int duration) async {
    return await _channel.invokeMethod('onLearn', <String, dynamic>{
      'profile': profile,
      'course': course,
      'begin': begin,
      'duration': duration
    });
  }

  static Future<void> onRead(
      String profile, String book, int begin, int duration) async {
    return await _channel.invokeMethod('onRead', <String, dynamic>{
      'profile': profile,
      'book': book,
      'begin': begin,
      'duration': duration
    });
  }

  static Future<void> onBrowse(
      String profile, String content, int begin, int duration) async {
    return await _channel.invokeMethod('onBrowse', <String, dynamic>{
      'profile': profile,
      'content': content,
      'begin': begin,
      'duration': duration
    });
  }

  static Future<void> onTransaction(
      String profile, TalkingDataTransaction transaction) async {
    return await _channel.invokeMethod('onTransaction', <String, dynamic>{
      'profile': profile,
      'transactionId': transaction.transactionId,
      'category': transaction.category,
      'amount': transaction.amount,
      'personA': transaction.personA,
      'personB': transaction.personB,
      'startDate': transaction.startDate,
      'endDate': transaction.endDate,
      'currencyType': transaction.currencyType,
      'content': transaction.content
    });
  }

  static Future<void> onCredit(
      String profile, int mount, String content) async {
    return await _channel.invokeMethod('onCredit', <String, dynamic>{
      'profile': profile,
      'amount': mount,
      'content': content
    });
  }

  static Future<void> onChargeBack(
      String profile, String orderId, String reason, String type) async {
    return await _channel.invokeMethod('onChargeBack', <String, dynamic>{
      'profile': profile,
      'orderId': orderId,
      'reason': reason,
      'type': type
    });
  }

  static Future<void> onCreateRole(String name) async {
    return await _channel.invokeMethod('onCreateRole', <String, dynamic>{
      'name': name,
    });
  }

  static Future<void> onTrialFinished(String profile, String content) async {
    return await _channel.invokeMethod('onTrialFinished',
        <String, dynamic>{'profile': profile, 'content': content});
  }

  static Future<void> onGuideFinished(String profile, String content) async {
    return await _channel.invokeMethod('onGuideFinished',
        <String, dynamic>{'profile': profile, 'content': content});
  }

  static Future<void> onPreviewFinished(String profile, String content) async {
    return await _channel.invokeMethod('onPreviewFinished',
        <String, dynamic>{'profile': profile, 'content': content});
  }

  static Future<void> onLevelPass(String profile, String levelId) async {
    return await _channel.invokeMethod('onLevelPass',
        <String, dynamic>{'profile': profile, 'levelId': levelId});
  }

  static Future<void> onFreeFinished(String profile, String content) async {
    return await _channel.invokeMethod('onFreeFinished',
        <String, dynamic>{'profile': profile, 'content': content});
  }

  static Future<void> onAchievementUnlock(
      String profile, String achievementId) async {
    return await _channel.invokeMethod('onAchievementUnlock',
        <String, dynamic>{'profile': profile, 'achievementId': achievementId});
  }

  static Future<void> onCancelOrder(TalkingDataOrder order) async {
    return await _channel.invokeMethod("onCancelOrder", <String, dynamic>{
      'orderID': order.orderID,
      'totalPrice': order.totalPrice,
      'currencyType': order.currencyType,
      'orderDetails': order._orderDetails
    });
  }

  static Future<void> onOrderPaySucc(
      TalkingDataOrder order, String payType, String profileID) async {
    return await _channel.invokeMethod('onOrderPaySucc', <String, dynamic>{
      'profileID': profileID,
      'payType': payType,
      'orderID': order.orderID,
      'totalPrice': order.totalPrice,
      'currencyType': order.currencyType,
      'orderDetails': order._orderDetails
    });
  }

  static Future<void> onAddItemToShoppingCart(String itemId, String category,
      String name, int unitPrice, int amount) async {
    return await _channel
        .invokeMethod('onAddItemToShoppingCart', <String, dynamic>{
      'itemID': itemId,
      'category': category,
      'name': name,
      'unitPrice': unitPrice,
      'amount': amount
    });
  }

  static Future<void> onViewItem(
      String itemId, String category, String name, int unitPrice) async {
    return await _channel.invokeMethod('onViewItem', <String, dynamic>{
      'itemId': itemId,
      'category': category,
      'name': name,
      'unitPrice': unitPrice
    });
  }

  static Future<void> onViewShoppingCart(TalkingDataShoppingCart shoppingCart) async {
    return await _channel.invokeMethod('onViewShoppingCart', <String, dynamic>{
      'shoppingCartDetails': shoppingCart._shoppingCartDetails
    });
  }
}

enum TalkingDataProfileType {
  ANONYMOUS, // 匿名
  REGISTERED, // 自有帐户显性注册
  SINA_WEIBO, // 新浪微博
  QQ, // QQ账号
  QQ_WEIBO, // QQ微博账号
  ND91, // 网龙91
  WEIXIN, //微信账号
  TYPE1, //
  TYPE2, //
  TYPE3, //
  TYPE4, //
  TYPE5, //
  TYPE6, //
  TYPE7, //
  TYPE8, //
  TYPE9, //
  TYPE10 //
}

enum TalkingDataGender{
  UNKNOWN,//未知
  MALE,//男
  FEMALE//女
}

class TalkingDataProfile{
  TalkingDataProfile({
    this.name,
    this.type,
    this.gender,
    this.age,
    this.property1,
    this.property2,
    this.property3,
    this.property4,
    this.property5,
    this.property6,
    this.property7,
    this.property8,
    this.property9,
    this.property10
  });
  final String? name;
  final TalkingDataProfileType? type;
  final TalkingDataGender? gender;
  final int? age;
  final Object? property1;
  final Object? property2;
  final Object? property3;
  final Object? property4;
  final Object? property5;
  final Object? property6;
  final Object? property7;
  final Object? property8;
  final Object? property9;
  final Object? property10;
}

class TalkingDataOrder {
  TalkingDataOrder({
    this.orderID,
    this.totalPrice,
    this.currencyType,
  });

  final String? orderID;

  final int? totalPrice;

  final String? currencyType;

  final List _orderDetails = [];

  addItem(String id, String category, String name, int unitPrice, int amount) {
    Map map = {};
    map['itemID'] = id;
    map['category'] = category;
    map['name'] = name;
    map['unitPrice'] = unitPrice;
    map['amount'] = amount;
    _orderDetails.add(map);
  }
}

class TalkingDataShoppingCart {
  TalkingDataShoppingCart();

  final List _shoppingCartDetails = [];

  addItem(
      String itemID, String category, String name, int unitPrice, int amount) {
    Map map = {};
    map['itemID'] = itemID;
    map['category'] = category;
    map['name'] = name;
    map['unitPrice'] = unitPrice;
    map['amount'] = amount;
    _shoppingCartDetails.add(map);
  }
}

class TalkingDataSearch {
  final String? category;
  final String? content;
  final String? itemId;
  final String? itemLocationId;
  final String? destination;
  final String? origin;
  final int? startDate;
  final int? endDate;
  TalkingDataSearch({this.category,
    this.content,
    this.destination,
    this.endDate,
    this.itemId,
    this.itemLocationId,
    this.origin,
    this.startDate});
}

class TalkingDataTransaction {
  final String? transactionId;
  final String? category;
  final int? amount;
  final String? personA;
  final String? personB;
  final int? startDate;
  final int? endDate;
  final String? currencyType;
  final String? content;

  TalkingDataTransaction({this.transactionId,
    this.category,
    this.amount,
    this.personA,
    this.personB,
    this.startDate,
    this.endDate,
    this.currencyType,
    this.content});
}