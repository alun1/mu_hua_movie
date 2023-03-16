package com.talkingdata.talkingdata_sdk_plugin;

import android.content.Context;

import androidx.annotation.NonNull;

import com.tendcloud.tenddata.TalkingDataGender;
import com.tendcloud.tenddata.TalkingDataOrder;
import com.tendcloud.tenddata.TalkingDataProfile;
import com.tendcloud.tenddata.TalkingDataProfileType;
import com.tendcloud.tenddata.TalkingDataSDK;
import com.tendcloud.tenddata.TalkingDataSearch;
import com.tendcloud.tenddata.TalkingDataShoppingCart;
import com.tendcloud.tenddata.TalkingDataTransaction;
import java.util.List;
import java.util.Map;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

public class TalkingDataSDKPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private static Context mContext;

  public static void registerWith(PluginRegistry.Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "talkingdata_sdk_plugin");
    channel.setMethodCallHandler(new TalkingDataSDKPlugin());
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "talkingdata_sdk_plugin");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  public static void setContext(Context ctx) {
    mContext = ctx;
  }

  public static Context getContext() {
    return mContext;
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "init":
        TalkingDataSDK.init(mContext,(String) call.argument("appID"),(String) call.argument("channelID"),(String) call.argument("custom"));
        break;
      case "getDeviceID":
        result.success(TalkingDataSDK.getDeviceId(mContext));
        break;
      case "getOAID":
        result.success(TalkingDataSDK.getOAID(mContext));
        break;
      case "onPageBegin":
        TalkingDataSDK.onPageBegin(mContext, (String) call.argument("pageName"));
        break;
      case "onPageEnd":
        TalkingDataSDK.onPageEnd(mContext, (String) call.argument("pageName"));
        break;

      case "onEvent":
        Map paramWith = null;
        if (call.argument("params") instanceof Map) {
          paramWith = call.argument("params");
        }
        TalkingDataSDK.onEvent(mContext,
                (String) call.argument("eventID"),
                paramWith
        );
        break;
      case "setGlobalKV":
        String globalKey = call.argument("key");
        Object globalValue = call.argument("value");
        TalkingDataSDK.setGlobalKV(globalKey, globalValue);
        break;
      case "removeGlobalKV":
        String key = call.argument("key");
        TalkingDataSDK.removeGlobalKV(key);
        break;
      case "onRegister":
        String profileId = call.argument("profileId");
        String invitationCode = call.argument("invitationCode");
        TalkingDataProfile profile = TalkingDataProfile.createProfile();
        profile.setType(TalkingDataProfileType.valueOf((String)call.argument("type")));
        profile.setName((String)call.argument("name"));
        profile.setGender(TalkingDataGender.valueOf((String)call.argument("gender")));
        profile.setAge((int)call.argument("age"));
        profile.setProperty1((Object)call.argument("property1"));
        profile.setProperty2((Object)call.argument("property2"));
        profile.setProperty3((Object)call.argument("property3"));
        profile.setProperty4((Object)call.argument("property4"));
        profile.setProperty5((Object)call.argument("property5"));
        profile.setProperty6((Object)call.argument("property6"));
        profile.setProperty7((Object)call.argument("property7"));
        profile.setProperty8((Object)call.argument("property8"));
        profile.setProperty9((Object)call.argument("property9"));
        profile.setProperty10((Object)call.argument("property10"));
        TalkingDataSDK.onRegister(profileId, profile, invitationCode);
        break;
      case "onLogin":
        TalkingDataProfile profileLogin = TalkingDataProfile.createProfile();
        profileLogin.setType(TalkingDataProfileType.valueOf((String)call.argument("type")));
        profileLogin.setName((String)call.argument("name"));
        profileLogin.setGender(TalkingDataGender.valueOf((String)call.argument("gender")));
        profileLogin.setAge((int)call.argument("age"));
        profileLogin.setProperty1((Object)call.argument("property1"));
        profileLogin.setProperty2((Object)call.argument("property2"));
        profileLogin.setProperty3((Object)call.argument("property3"));
        profileLogin.setProperty4((Object)call.argument("property4"));
        profileLogin.setProperty5((Object)call.argument("property5"));
        profileLogin.setProperty6((Object)call.argument("property6"));
        profileLogin.setProperty7((Object)call.argument("property7"));
        profileLogin.setProperty8((Object)call.argument("property8"));
        profileLogin.setProperty9((Object)call.argument("property9"));
        profileLogin.setProperty10((Object)call.argument("property10"));
        TalkingDataSDK.onLogin((String) call.argument("profileId"), profileLogin);
        break;
      case "onProfileUpdate":
        TalkingDataProfile profileUpdate = TalkingDataProfile.createProfile();
        profileUpdate.setType(TalkingDataProfileType.valueOf((String)call.argument("type")));
        profileUpdate.setName((String)call.argument("name"));
        profileUpdate.setGender(TalkingDataGender.valueOf((String)call.argument("gender")));
        profileUpdate.setAge((int)call.argument("age"));
        profileUpdate.setProperty1((Object)call.argument("property1"));
        profileUpdate.setProperty2((Object)call.argument("property2"));
        profileUpdate.setProperty3((Object)call.argument("property3"));
        profileUpdate.setProperty4((Object)call.argument("property4"));
        profileUpdate.setProperty5((Object)call.argument("property5"));
        profileUpdate.setProperty6((Object)call.argument("property6"));
        profileUpdate.setProperty7((Object)call.argument("property7"));
        profileUpdate.setProperty8((Object)call.argument("property8"));
        profileUpdate.setProperty9((Object)call.argument("property9"));
        profileUpdate.setProperty10((Object)call.argument("property10"));
        TalkingDataSDK.onProfileUpdate(profileUpdate);
        break;
      case "onCreateCard":
        TalkingDataSDK.onCreateCard((String) call.argument("profile"),
                (String) call.argument("method"),
                (String) call.argument("content"));
        break;
      case "onReceiveDeepLink":
        TalkingDataSDK.onReceiveDeepLink((String) call.argument("link"));
        break;
      case "onFavorite":
        TalkingDataSDK.onFavorite((String) call.argument("category"),
                (String) call.argument("content"));
        break;
      case "onShare":
        TalkingDataSDK.onShare((String) call.argument("profile"),
                (String) call.argument("content"));
        break;
      case "onPunch":
        TalkingDataSDK.onPunch((String) call.argument("profile"),
                (String) call.argument("punchId"));
        break;
      case "onSearch":
        TalkingDataSearch tdSearch = TalkingDataSearch.createSearch();
        tdSearch.setCategory((String) call.argument("category"));
        tdSearch.setContent((String) call.argument("content"));
        tdSearch.setItemId((String) call.argument("itemId"));
        tdSearch.setItemLocationId((String) call.argument("itemLocationId"));
        tdSearch.setDestination((String) call.argument("destination"));
        tdSearch.setOrigin((String) call.argument("origin"));
        tdSearch.setStartDate(callTransInt(call, "startDate"));
        tdSearch.setEndDate(callTransInt(call, "endDate"));
        TalkingDataSDK.onSearch(tdSearch);
        break;
      case "onReservation":
        TalkingDataSDK.onReservation((String) call.argument("profile"),
                (String) call.argument("reservationId"),
                (String) call.argument("category"),
                callTransInt(call, "amount"),
                (String) call.argument("term"));
        break;
      case "onBooking":
        TalkingDataSDK.onBooking((String) call.argument("profile"),
                (String) call.argument("bookingId"),
                (String) call.argument("category"),
                callTransInt(call, "amount"),
                (String) call.argument("content"));
        break;
      case "onContact":
        TalkingDataSDK.onContact((String) call.argument("profile"),
                (String) call.argument("content"));
        break;
      case "onAchievementUnlock":
        TalkingDataSDK.onAchievementUnlock((String) call.argument("profile"),
                (String) call.argument("achievementId"));
        break;
      case "onViewItem":
        TalkingDataSDK.onViewItem((String) call.argument("itemId"),
                (String) call.argument("category"),
                (String) call.argument("name"),
                callTransInt(call, "unitPrice"));
        break;
      case "onViewShoppingCart":
        TalkingDataShoppingCart shoppingCart = TalkingDataShoppingCart.createShoppingCart();
        List<Map> shoppingCartDetails = call.argument("shoppingCartDetails");
        for (int i = 0; i < shoppingCartDetails.size(); i++) {
          Map map = shoppingCartDetails.get(i);
          shoppingCart.addItem(
                  (String) map.get("itemID"),
                  (String) map.get("category"),
                  (String) map.get("name"),
                  mapTransInt(map, "unitPrice"),
                  mapTransInt(map, "amount")
          );
        }
        TalkingDataSDK.onViewShoppingCart(shoppingCart);
        break;
      case "onAddItemToShoppingCart":
        TalkingDataSDK.onAddItemToShoppingCart((String) call.argument("itemID"),
                (String) call.argument("category"),
                (String) call.argument("name"),
                callTransInt(call, "unitPrice"),
                callTransInt(call, "amount"));
        break;
      case "onPlaceOrder":
        TalkingDataSDK.onPlaceOrder(getOrderFromFlutter(call),
                (String) call.argument("profileID")
        );
        break;
      case "onPay":
        TalkingDataSDK.onPay(
                (String) call.argument("profile"),
                (String) call.argument("orderId"),
                callTransInt(call, "amount"),
                (String) call.argument("currencyType"),
                (String) call.argument("payType"),
                (String) call.argument("itemId"),
                callTransInt(call, "itemCount"));
        break;
      case "onLearn":
        TalkingDataSDK.onLearn(
                (String) call.argument("profile"),
                (String) call.argument("course"),
                callTransInt(call, "begin"),
                callTransInt(call, "duration"));
        break;
      case "onRead":
        TalkingDataSDK.onRead(
                (String) call.argument("profile"),
                (String) call.argument("book"),
                callTransInt(call, "begin"),
                callTransInt(call, "duration"));
        break;
      case "onBrowse":
        TalkingDataSDK.onBrowse(
                (String) call.argument("profile"),
                (String) call.argument("content"),
                callTransInt(call, "begin"),
                callTransInt(call, "duration"));
        break;
      case "onTransaction":
        TalkingDataTransaction transaction = TalkingDataTransaction.createTransaction();
        transaction.setTransactionId((String) call.argument("transactionId"));
        transaction.setCategory((String) call.argument("category"));
        transaction.setAmount(callTransInt(call, "amount"));
        transaction.setPersonA((String) call.argument("personA"));
        transaction.setPersonB((String) call.argument("personB"));
        transaction.setStartDate(callTransInt(call, "startDate"));
        transaction.setEndDate(callTransInt(call, "endDate"));
        transaction.setCurrencyType((String) call.argument("currencyType"));
        transaction.setContent((String) call.argument("content"));
        TalkingDataSDK.onTransaction(
                (String) call.argument("profile"),
                transaction);

        break;
      case "onCredit":
        TalkingDataSDK.onCredit(
                (String) call.argument("profile"),
                callTransInt(call, "amount"),
                (String) call.argument("content"));
        break;
      case "onChargeBack":
        TalkingDataSDK.onChargeBack(
                (String) call.argument("profile"),
                (String) call.argument("orderId"),
                (String) call.argument("reason"),
                (String) call.argument("type"));
        break;
      case "onCreateRole":
        TalkingDataSDK.onCreateRole((String) call.argument("name"));
        break;
      case "onTrialFinished":
        TalkingDataSDK.onTrialFinished(
                (String) call.argument("profile"),
                (String) call.argument("content"));
        break;
      case "onGuideFinished":
        TalkingDataSDK.onGuideFinished(
                (String) call.argument("profile"),
                (String) call.argument("content"));
        break;
      case "onPreviewFinished":
        TalkingDataSDK.onPreviewFinished(
                (String) call.argument("profile"),
                (String) call.argument("content"));
        break;
      case "onFreeFinished":
        TalkingDataSDK.onFreeFinished(
                (String) call.argument("profile"),
                (String) call.argument("content"));
        break;
      case "onLevelPass":
        TalkingDataSDK.onLevelPass(
                (String) call.argument("profile"),
                (String) call.argument("levelId"));
        break;
      case "onOrderPaySucc":
        TalkingDataSDK.onOrderPaySucc(getOrderFromFlutter(call),
                (String) call.argument("payType"),
                (String) call.argument("profileID"));
        break;
      case "onCancelOrder":
        TalkingDataSDK.onCancelOrder(getOrderFromFlutter(call));
        break;
      default:
        result.notImplemented();
        break;
    }
  }
  private TalkingDataOrder getOrderFromFlutter(MethodCall call) {
    TalkingDataOrder order = null;
    try {
      String orderID = call.argument("orderID");
      int totalPrice = callTransInt(call, "totalPrice");
      String currencyType = call.argument("currencyType");

      List orderDetails = call.argument("orderDetails");

      order = TalkingDataOrder.createOrder(orderID, totalPrice, currencyType);
      for (int i = 0; i < orderDetails.size(); i++) {
        Map<String, Object> map = (Map) orderDetails.get(i);
        String id = String.valueOf(map.get("itemID"));
        String category = String.valueOf(map.get("category"));
        String name = String.valueOf(map.get("name"));
        int unitPrice = mapTransInt(map, "unitPrice");
        int amount = mapTransInt(map, "amount");
        order.addItem(id, category, name, unitPrice, amount);
      }
    } catch (Throwable t) {
      t.printStackTrace();
    }

    return order;
  }

  private int mapTransInt(Map map, String dsc) {
    if (map.get(dsc) != null) {
      return (int) map.get(dsc);
    } else {
      return 0;
    }
  }

  private int callTransInt(MethodCall call, String dsc) {
    if (call.argument(dsc) != null) {
      return (int) call.argument(dsc);
    } else {
      return 0;
    }
  }
}
