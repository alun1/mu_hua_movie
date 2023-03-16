#import "TalkingDataSDKPlugin.h"
#import "TalkingDataSDK.h"

@implementation TalkingDataSDKPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"talkingdata_sdk_plugin"
            binaryMessenger:[registrar messenger]];
  TalkingDataSDKPlugin* instance = [[TalkingDataSDKPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

+ (void)init:(NSString*)appId channelId:(NSString*)channelId custom:(NSString *)custom
{
   [TalkingDataSDK init:appId channelId:channelId custom:custom];
}


-(id)checkArgument:(NSDictionary*)argument forKey:(NSString*)key ofType:(Class)clazz
{
    if (key == nil || argument == nil || clazz == nil  ) {
        return nil;
    }
    id arg = [argument objectForKey:key];
    if (arg == nil) {
        return nil;
    }
    if (![arg isKindOfClass:clazz]) {
        return nil;
    }
    return arg;
}


-(TalkingDataProfileType)profileTypeConvert:(NSString*)accTypeStr
{
    if ([accTypeStr isEqualToString:@"ANONYMOUS"]) {
        return TalkingDataProfileTypeAnonymous;
    }else if ([accTypeStr isEqualToString:@"REGISTERED"]){
        return TalkingDataProfileTypeRegistered;
    }else if ([accTypeStr isEqualToString:@"SINA_WEIBO"]){
        return TalkingDataProfileTypeSinaWeibo;
    }else if ([accTypeStr isEqualToString:@"QQ"]){
        return TalkingDataProfileTypeQQ;
    }else if ([accTypeStr isEqualToString:@"QQ_WEIBO"]){
        return TalkingDataProfileTypeQQWeibo;
    }else if ([accTypeStr isEqualToString:@"ND91"]){
        return TalkingDataProfileTypeND91;
    }else if ([accTypeStr isEqualToString:@"WEIXIN"]){
        return TalkingDataProfileTypeWeiXin;
    }else if ([accTypeStr isEqualToString:@"TYPE1"]){
        return TalkingDataProfileTypeType1;
    }else if ([accTypeStr isEqualToString:@"TYPE2"]){
        return TalkingDataProfileTypeType2;
    }else if ([accTypeStr isEqualToString:@"TYPE3"]){
        return TalkingDataProfileTypeType3;
    }else if ([accTypeStr isEqualToString:@"TYPE4"]){
        return TalkingDataProfileTypeType4;
    }else if ([accTypeStr isEqualToString:@"TYPE5"]){
        return TalkingDataProfileTypeType5;
    }else if ([accTypeStr isEqualToString:@"TYPE6"]){
        return TalkingDataProfileTypeType6;
    }else if ([accTypeStr isEqualToString:@"TYPE7"]){
        return TalkingDataProfileTypeType7;
    }else if ([accTypeStr isEqualToString:@"TYPE8"]){
        return TalkingDataProfileTypeType8;
    }else if ([accTypeStr isEqualToString:@"TYPE9"]){
        return TalkingDataProfileTypeType9;
    }else if ([accTypeStr isEqualToString:@"TYPE10"]){
        return TalkingDataProfileTypeType10;
    }
    return TalkingDataProfileTypeAnonymous;
}



-(TalkingDataGender)genderConvert:(NSString*)accGenderStr
{
    if ([accGenderStr isEqualToString:@"UNKNOWN"]) {
        return TalkingDataGenderUnknown;
    }else if ([accGenderStr isEqualToString:@"MALE"]){
        return TalkingDataGenderMale;
    }else if ([accGenderStr isEqualToString:@"FEMALE"]){
        return TalkingDataGenderFemale;
    }
    return TalkingDataGenderUnknown;
}

-(TalkingDataProfile *)profileConvert:(NSDictionary *)arguments {
    NSString * profileName = [self checkArgument:arguments forKey:@"name" ofType:[NSString class]];
    NSString * profileType = [self checkArgument:arguments forKey:@"type" ofType:[NSString class]];
    NSString * profileGender = [self checkArgument:arguments forKey:@"gender" ofType:[NSString class]];
    NSNumber * profileAge = [self checkArgument:arguments forKey:@"age" ofType:[NSNumber class]];
    NSObject * profileValue1 = [self checkArgument:arguments forKey:@"property1" ofType:[NSObject class]];
    NSObject * profileValue2 = [self checkArgument:arguments forKey:@"property2" ofType:[NSObject class]];
    NSObject * profileValue3 = [self checkArgument:arguments forKey:@"property3" ofType:[NSObject class]];
    NSObject * profileValue4 = [self checkArgument:arguments forKey:@"property4" ofType:[NSObject class]];
    NSObject * profileValue5 = [self checkArgument:arguments forKey:@"property5" ofType:[NSObject class]];
    NSObject * profileValue6 = [self checkArgument:arguments forKey:@"property6" ofType:[NSObject class]];
    NSObject * profileValue7 = [self checkArgument:arguments forKey:@"property7" ofType:[NSObject class]];
    NSObject * profileValue8 = [self checkArgument:arguments forKey:@"property8" ofType:[NSObject class]];
    NSObject * profileValue9 = [self checkArgument:arguments forKey:@"property9" ofType:[NSObject class]];
    NSObject * profileValue10 = [self checkArgument:arguments forKey:@"property10" ofType:[NSObject class]];
    TalkingDataProfileType type = [self profileTypeConvert:profileType];
    TalkingDataGender gender = [self genderConvert:profileGender];
    TalkingDataProfile *profile = [TalkingDataProfile createProfile];
    profile.name = profileName;
    profile.type = type;
    profile.gender = gender;
    profile.age = [profileAge intValue];
    profile.property1 = profileValue1;
    profile.property2 = profileValue2;
    profile.property3 = profileValue3;
    profile.property4 = profileValue4;
    profile.property5 = profileValue5;
    profile.property6 = profileValue6;
    profile.property7 = profileValue7;
    profile.property8 = profileValue8;
    profile.property9 = profileValue9;
    profile.property10 = profileValue10;
    return profile;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if([@"init" isEqualToString:call.method]){
                NSString * appId = [self checkArgument:call.arguments forKey:@"appID" ofType:[NSString class]];
                NSString * channelId = [self checkArgument:call.arguments forKey:@"channelID" ofType:[NSString class]];
                NSString * custom = [self checkArgument:call.arguments forKey:@"custom" ofType:[NSString class]];
                if (appId && channelId) {
                      [TalkingDataSDK init:appId channelId:channelId custom:custom];
                }
      }
      else if ([@"onPageBegin" isEqualToString:call.method]){
          NSString * pageName = [self checkArgument:call.arguments forKey:@"pageName" ofType:[NSString class]];
          if (pageName) {
              [TalkingDataSDK onPageBegin:pageName];
          }
      } else if ([@"onPageEnd" isEqualToString:call.method]){
          NSString * pageName = [self checkArgument:call.arguments forKey:@"pageName" ofType:[NSString class]];
          if (pageName) {
              [TalkingDataSDK onPageEnd:pageName];
          }
      } else  if ([@"onRegister" isEqualToString:call.method]){
          NSString * profileID = [self checkArgument:call.arguments forKey:@"profileId" ofType:[NSString class]];
          NSString * invitationCode =[self checkArgument:call.arguments forKey:@"invitationCode" ofType:[NSString class]];
          TalkingDataProfile *profile = [self profileConvert:call.arguments];
          [TalkingDataSDK onRegister:profileID profile:profile invitationCode:invitationCode];
      } else if ([@"onLogin" isEqualToString:call.method]){
          NSString * profileID = [self checkArgument:call.arguments forKey:@"profileId" ofType:[NSString class]];
          TalkingDataProfile *profile = [self profileConvert:call.arguments];
          [TalkingDataSDK onLogin:profileID profile:profile];
      } else if ([@"onProfileUpdate" isEqualToString:call.method]){
          TalkingDataProfile *profile = [self profileConvert:call.arguments];
          [TalkingDataSDK onProfileUpdate:profile];
      } else if([@"onEvent" isEqualToString:call.method]){
          NSString * eventID = [self checkArgument:call.arguments forKey:@"eventID" ofType:[NSString class]];
          NSDictionary * params = [self checkArgument:call.arguments forKey:@"params" ofType:[NSDictionary class]];

          if (eventID) {
  //#error 记得更新最新的.a和.h，然后打开下边的注释。
              [TalkingDataSDK onEvent:eventID parameters:params];
          }
      }
//      else if ([@"onAddItemToShoppingCart" isEqualToString:call.method]){
//          NSNumber * amount = [self checkArgument:call.arguments forKey:@"amount" ofType:[NSNumber class]];
//          NSString * category = [self checkArgument:call.arguments forKey:@"category" ofType:[NSString class]];
//          NSString * itemID = [self checkArgument:call.arguments forKey:@"itemID" ofType:[NSString class]];
//          NSString * name = [self checkArgument:call.arguments forKey:@"name" ofType:[NSString class]];
//          NSNumber * uniprice = [self checkArgument:call.arguments forKey:@"unitPrice" ofType:[NSNumber class]];
//          [TalkingDataSDK onAddItemToShoppingCart:itemID category:category name:name unitPrice:uniprice.intValue amount:amount.intValue];
//      }
//
//      else if ([@"onViewShoppingCart" isEqualToString:call.method]){
//          NSArray * shoppingCartDetails = [self checkArgument:call.arguments forKey:@"shoppingCartDetails" ofType:[NSArray class]];
//          TalkingDataShoppingCart * sc = [TalkingDataShoppingCart createShoppingCart];
//          for (NSDictionary* each in shoppingCartDetails) {
//              NSNumber * amount = [self checkArgument:each forKey:@"amount" ofType:[NSNumber class]];
//              NSString * category = [self checkArgument:each forKey:@"category" ofType:[NSString class]];
//              NSString * itemID = [self checkArgument:each forKey:@"itemID" ofType:[NSString class]];
//              NSString * name = [self checkArgument:each forKey:@"name" ofType:[NSString class]];
//              NSNumber * uniprice = [self checkArgument:each forKey:@"unitPrice" ofType:[NSNumber class]];
//              [sc addItem:itemID category:category name:name unitPrice:uniprice.intValue amount:amount.intValue];
//          }
//          [TalkingDataSDK onViewShoppingCart:sc];
//      }
//
//      else if ([@"onPlaceOrder" isEqualToString:call.method]){
//          NSString * profileID = [self checkArgument:call.arguments forKey:@"profileID" ofType:[NSString class]];
//          NSString * currencyType = [self checkArgument:call.arguments forKey:@"currencyType" ofType:[NSString class]];
//          NSArray * orderDetails = [self checkArgument:call.arguments forKey:@"orderDetails" ofType:[NSArray class]];
//          NSString * orderID = [self checkArgument:call.arguments forKey:@"orderID" ofType:[NSString class]];
//          NSNumber * totalPrice = [self checkArgument:call.arguments forKey:@"totalPrice" ofType:[NSNumber class]];
//
//          TalkingDataOrder * order = [TalkingDataOrder createOrder:orderID total:totalPrice.intValue currencyType:currencyType];
//
//          for (NSDictionary * each in orderDetails) {
//              NSNumber * amount = [self checkArgument:each forKey:@"amount" ofType:[NSNumber class]];
//              NSString * category = [self checkArgument:each forKey:@"category" ofType:[NSString class]];
//              NSString * itemID = [self checkArgument:each forKey:@"itemID" ofType:[NSString class]];
//              NSString * name = [self checkArgument:each forKey:@"name" ofType:[NSString class]];
//              NSNumber * uniprice = [self checkArgument:each forKey:@"unitPrice" ofType:[NSNumber class]];
//              [order addItem:itemID category:category name:name unitPrice:uniprice.intValue amount:amount.intValue];
//          }
//          [TalkingDataSDK onPlaceOrder:order profileId:profileID];
//
//      }
      
//      else if ([@"onOrderPaySucc" isEqualToString:call.method]){
//          NSString * profileID = [self checkArgument:call.arguments forKey:@"profileID" ofType:[NSString class]];
//          NSString * currencyType = [self checkArgument:call.arguments forKey:@"currencyType" ofType:[NSString class]];
//          NSArray * orderDetails = [self checkArgument:call.arguments forKey:@"orderDetails" ofType:[NSArray class]];
//          NSString * orderID = [self checkArgument:call.arguments forKey:@"orderID" ofType:[NSString class]];
//          NSString * payType = [self checkArgument:call.arguments forKey:@"payType" ofType:[NSString class]];
//          NSNumber * totalPrice = [self checkArgument:call.arguments forKey:@"totalPrice" ofType:[NSNumber class]];
//
//          TalkingDataOrder * order = [TalkingDataOrder createOrder:orderID total:totalPrice.intValue currencyType:currencyType];
//
//          for (NSDictionary * each in orderDetails) {
//              NSNumber * amount = [self checkArgument:each forKey:@"amount" ofType:[NSNumber class]];
//              NSString * category = [self checkArgument:each forKey:@"category" ofType:[NSString class]];
//              NSString * itemID = [self checkArgument:each forKey:@"itemID" ofType:[NSString class]];
//              NSString * name = [self checkArgument:each forKey:@"name" ofType:[NSString class]];
//              NSNumber * uniprice = [self checkArgument:each forKey:@"unitPrice" ofType:[NSNumber class]];
//              [order addItem:itemID category:category name:name unitPrice:uniprice.intValue amount:amount.intValue];
//          }
//          [TalkingDataSDK onOrderPaySucc:order paymentType:payType profileId:profileID ];
//      }
//      else if ([@"onCancelOrder" isEqualToString:call.method]){
//               NSString * currencyType = [self checkArgument:call.arguments forKey:@"currencyType" ofType:[NSString class]];
//               NSString * orderID = [self checkArgument:call.arguments forKey:@"orderID" ofType:[NSString class]];
//               NSNumber * totalPrice = [self checkArgument:call.arguments forKey:@"totalPrice" ofType:[NSNumber class]];
//
//               TalkingDataOrder * order = [TalkingDataOrder createOrder:orderID total:totalPrice.intValue currencyType:currencyType];
//
//               [TalkingDataSDK onCancelOrder:order];
//      }
      
      else if ([@"setGlobalKV" isEqualToString:call.method]) {
          NSString * key = [self checkArgument:call.arguments forKey:@"key" ofType:[NSString class]];
          id value = call.arguments[@"value"];
          if (value) {
              [TalkingDataSDK setGlobalKV:key value:value];
          }
      }else if ([@"removeGlobalKV" isEqualToString:call.method]){
          NSString * key = [self checkArgument:call.arguments forKey:@"key" ofType:[NSString class]];
          [TalkingDataSDK removeGlobalKV:key];
      }else if([@"setVerboseLogDisable" isEqualToString:call.method]){
          [TalkingDataSDK setVerboseLogDisable];
      }else if([@"backgroundSessionEnabled" isEqualToString:call.method]){
          [TalkingDataSDK backgroundSessionEnabled];
      }else if ([@"getDeviceID" isEqualToString:call.method]){
          NSString * deviceid = [TalkingDataSDK getDeviceId];
          result(deviceid);
      }else if([@"onCreateCard" isEqualToString:call.method]){
               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
               NSString * method = [self checkArgument:call.arguments forKey:@"method" ofType:[NSString class]];
               NSString * content = [self checkArgument:call.arguments forKey:@"content" ofType:[NSString class]];
               if (profile && method && content) {
                   [TalkingDataSDK onCreateCard:profile method:method content:content];
               }

           }else if([@"onReceiveDeepLink" isEqualToString:call.method]){
               NSString * link = [self checkArgument:call.arguments forKey:@"link" ofType:[NSString class]];
               if (link) {
                   [TalkingDataSDK onReceiveDeepLink:[NSURL URLWithString:link]];
               }
           }else if([@"onFavorite" isEqualToString:call.method]){
               NSString * category = [self checkArgument:call.arguments forKey:@"category" ofType:[NSString class]];
               NSString * content = [self checkArgument:call.arguments forKey:@"content" ofType:[NSString class]];
               if (category && content) {
                   [TalkingDataSDK onFavorite:category content:content];
               }
           }else if([@"onShare" isEqualToString:call.method]){
               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
               NSString * content = [self checkArgument:call.arguments forKey:@"content" ofType:[NSString class]];
               if (profile && content) {
                   [TalkingDataSDK onShare:profile content:content];
               }
           }else if([@"onPunch" isEqualToString:call.method]){
               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
               NSString * punchId = [self checkArgument:call.arguments forKey:@"punchId" ofType:[NSString class]];
               if (profile && punchId) {
                   [TalkingDataSDK onPunch:profile punchId:punchId];
               }
           }
           
//           else if([@"onSearch" isEqualToString:call.method]){
//               NSString * category = [self checkArgument:call.arguments forKey:@"category" ofType:[NSString class]];
//               NSString * content = [self checkArgument:call.arguments forKey:@"content" ofType:[NSString class]];
//               NSString * itemId = [self checkArgument:call.arguments forKey:@"itemId" ofType:[NSString class]];
//               NSString * itemLocationId = [self checkArgument:call.arguments forKey:@"itemLocationId" ofType:[NSString class]];
//               NSString * destination = [self checkArgument:call.arguments forKey:@"destination" ofType:[NSString class]];
//               NSString * origin = [self checkArgument:call.arguments forKey:@"origin" ofType:[NSString class]];
//               NSNumber * startDate = [self checkArgument:call.arguments forKey:@"startDate" ofType:[NSNumber class]];
//               NSNumber * endDate = [self checkArgument:call.arguments forKey:@"endDate" ofType:[NSNumber class]];
//               TalkingDataSearch * search = [TalkingDataSearch createSearch];
//               search.category = category;
//               search.content = content;
//               search.itemId = itemId;
//               search.itemLocationId = itemLocationId;
//               search.destination = destination;
//               search.origin = origin;
//               search.startDate = startDate.longLongValue;
//               search.endDate = endDate.longLongValue;
//               [TalkingDataSDK onSearch:search];
//           }
           
//           else if([@"onReservation" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * reservationId = [self checkArgument:call.arguments forKey:@"reservationId" ofType:[NSString class]];
//               NSString * category = [self checkArgument:call.arguments forKey:@"category" ofType:[NSString class]];
//               NSString * amount = [self checkArgument:call.arguments forKey:@"amount" ofType:[NSNumber class]];
//               NSString * term = [self checkArgument:call.arguments forKey:@"term" ofType:[NSString class]];
//               [TalkingDataSDK onReservation:profile reservationId:reservationId category:category amount:amount.intValue term:term];
//           }
           
//           else if([@"onBooking" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * bookingId = [self checkArgument:call.arguments forKey:@"bookingId" ofType:[NSString class]];
//               NSString * category = [self checkArgument:call.arguments forKey:@"category" ofType:[NSString class]];
//               NSString * amount = [self checkArgument:call.arguments forKey:@"amount" ofType:[NSNumber class]];
//               NSString * content = [self checkArgument:call.arguments forKey:@"content" ofType:[NSString class]];
//               [TalkingDataSDK onBooking:profile bookingId:bookingId category:category amount:amount.intValue content:content];
//           }
//
//           else if([@"onContact" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * content = [self checkArgument:call.arguments forKey:@"content" ofType:[NSString class]];
//               if (profile && content) {
//                   [TalkingDataSDK onContact:profile content:content];
//               }
//           }
//
//           else if([@"onViewItem" isEqualToString:call.method]){
//               NSString * category = [self checkArgument:call.arguments forKey:@"category" ofType:[NSString class]];
//               NSString * itemId = [self checkArgument:call.arguments forKey:@"itemId" ofType:[NSString class]];
//               NSString * name = [self checkArgument:call.arguments forKey:@"name" ofType:[NSString class]];
//               NSNumber * unitPrice = [self checkArgument:call.arguments forKey:@"unitPrice" ofType:[NSNumber class]];
//               [TalkingDataSDK onViewItem:itemId category:category name:name unitPrice:unitPrice.intValue];
//           }else if([@"onViewShoppingCart" isEqualToString:call.method]){
//               NSArray * shoppingCartDetails = [self checkArgument:call.arguments forKey:@"shoppingCartDetails" ofType:[NSArray class]];
//               TalkingDataShoppingCart * sc = [TalkingDataShoppingCart createShoppingCart];
//               for (NSDictionary* each in shoppingCartDetails) {
//                   NSNumber * amount = [self checkArgument:each forKey:@"amount" ofType:[NSNumber class]];
//                   NSString * category = [self checkArgument:each forKey:@"category" ofType:[NSString class]];
//                   NSString * itemID = [self checkArgument:each forKey:@"itemID" ofType:[NSString class]];
//                   NSString * name = [self checkArgument:each forKey:@"name" ofType:[NSString class]];
//                   NSNumber * uniprice = [self checkArgument:each forKey:@"unitPrice" ofType:[NSNumber class]];
//                   [sc addItem:itemID category:category name:name unitPrice:uniprice.intValue amount:amount.intValue];
//               }
//               [TalkingDataSDK onViewShoppingCart:sc];
//           }
//
//           else if ([@"onAddItemToShoppingCart" isEqualToString:call.method]){
//               NSNumber * amount = [self checkArgument:call.arguments forKey:@"amount" ofType:[NSNumber class]];
//               NSString * category = [self checkArgument:call.arguments forKey:@"category" ofType:[NSString class]];
//               NSString * itemID = [self checkArgument:call.arguments forKey:@"itemID" ofType:[NSString class]];
//               NSString * name = [self checkArgument:call.arguments forKey:@"name" ofType:[NSString class]];
//               NSNumber * uniprice = [self checkArgument:call.arguments forKey:@"unitPrice" ofType:[NSNumber class]];
//               [TalkingDataSDK onAddItemToShoppingCart:itemID category:category name:name unitPrice:uniprice.intValue amount:amount.intValue];
//           }else if ([@"onPlaceOrder" isEqualToString:call.method]){
//               NSString * profileID = [self checkArgument:call.arguments forKey:@"profileID" ofType:[NSString class]];
//               NSString * currencyType = [self checkArgument:call.arguments forKey:@"currencyType" ofType:[NSString class]];
//               NSArray * orderDetails = [self checkArgument:call.arguments forKey:@"orderDetails" ofType:[NSArray class]];
//               NSString * orderID = [self checkArgument:call.arguments forKey:@"orderID" ofType:[NSString class]];
//               NSNumber * totalPrice = [self checkArgument:call.arguments forKey:@"totalPrice" ofType:[NSNumber class]];
//               TalkingDataOrder * order = [TalkingDataOrder createOrder:orderID total:totalPrice.intValue currencyType:currencyType];
//               for (NSDictionary * each in orderDetails) {
//                   NSNumber * amount = [self checkArgument:each forKey:@"amount" ofType:[NSNumber class]];
//                   NSString * category = [self checkArgument:each forKey:@"category" ofType:[NSString class]];
//                   NSString * itemID = [self checkArgument:each forKey:@"itemID" ofType:[NSString class]];
//                   NSString * name = [self checkArgument:each forKey:@"name" ofType:[NSString class]];
//                   NSNumber * uniprice = [self checkArgument:each forKey:@"unitPrice" ofType:[NSNumber class]];
//                   [order addItem:itemID category:category name:name unitPrice:uniprice.intValue amount:amount.intValue];
//               }
//               [TalkingDataSDK onPlaceOrder:order profileId:profileID];
//           }
//           else if([@"onPay" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * orderId = [self checkArgument:call.arguments forKey:@"orderId" ofType:[NSString class]];
//               NSNumber * amount = [self checkArgument:call.arguments forKey:@"amount" ofType:[NSNumber class]];
//               NSString * currencyType = [self checkArgument:call.arguments forKey:@"currencyType" ofType:[NSString class]];
//               NSString * payType = [self checkArgument:call.arguments forKey:@"payType" ofType:[NSString class]];
//               NSString * itemId = [self checkArgument:call.arguments forKey:@"itemId" ofType:[NSString class]];
//               NSNumber * itemCount = [self checkArgument:call.arguments forKey:@"itemCount" ofType:[NSNumber class]];
//               [TalkingDataSDK onPay:profile orderId:orderId amount:amount.intValue currencyType:currencyType paymentType:payType itemId:itemId itemCount:itemCount.intValue];
//           }else if([@"onLearn" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * course = [self checkArgument:call.arguments forKey:@"course" ofType:[NSString class]];
//               NSNumber * begin = [self checkArgument:call.arguments forKey:@"begin" ofType:[NSNumber class]];
//               NSNumber * duration = [self checkArgument:call.arguments forKey:@"duration" ofType:[NSNumber class]];
//               [TalkingDataSDK onLearn:profile course:course begin:begin.intValue duration:duration.intValue];
//           }else if([@"onRead" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * book = [self checkArgument:call.arguments forKey:@"book" ofType:[NSString class]];
//               NSNumber * begin = [self checkArgument:call.arguments forKey:@"begin" ofType:[NSNumber class]];
//               NSNumber * duration = [self checkArgument:call.arguments forKey:@"duration" ofType:[NSNumber class]];
//               [TalkingDataSDK onRead:profile book:book begin:begin.intValue duration:duration.intValue];
//           }else if([@"onBrowse" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * content = [self checkArgument:call.arguments forKey:@"content" ofType:[NSString class]];
//               NSNumber * begin = [self checkArgument:call.arguments forKey:@"begin" ofType:[NSNumber class]];
//               NSNumber * duration = [self checkArgument:call.arguments forKey:@"duration" ofType:[NSNumber class]];
//               [TalkingDataSDK onBrowse:profile content:content begin:begin.longLongValue duration:duration.intValue];
//           }else if([@"onTransaction" isEqualToString:call.method]){
//               //to do with object
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//
//               NSString * transactionId = [self checkArgument:call.arguments forKey:@"transactionId" ofType:[NSString class]];
//               NSString * category = [self checkArgument:call.arguments forKey:@"category" ofType:[NSString class]];
//               NSNumber * amount = [self checkArgument:call.arguments forKey:@"amount" ofType:[NSNumber class]];
//               NSString * personA = [self checkArgument:call.arguments forKey:@"personA" ofType:[NSString class]];
//               NSString * personB = [self checkArgument:call.arguments forKey:@"personB" ofType:[NSString class]];
//               NSNumber * startDate = [self checkArgument:call.arguments forKey:@"startDate" ofType:[NSNumber class]];
//               NSNumber * endDate = [self checkArgument:call.arguments forKey:@"endDate" ofType:[NSNumber class]];
//               NSString * currencyType = [self checkArgument:call.arguments forKey:@"currencyType" ofType:[NSString class]];
//               NSString * content = [self checkArgument:call.arguments forKey:@"content" ofType:[NSString class]];
//
//               TalkingDataTransaction * transaction = [TalkingDataTransaction createTransaction];
//               transaction.transactionId = transactionId;
//               transaction.category = category;
//               transaction.amount = amount.intValue;
//               transaction.personA = personA;
//               transaction.personB = personB;
//               transaction.category = category;
//               transaction.category = category;
//               transaction.startDate = startDate.longLongValue;
//               transaction.endDate = endDate.longLongValue;
//               transaction.currencyType = currencyType;
//               transaction.content = content;
//
//               [TalkingDataSDK onTransaction:profile transaction:transaction];
//
//           }
//           else if ([@"onCredit" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSNumber * amount = [self checkArgument:call.arguments forKey:@"amount" ofType:[NSNumber class]];
//               NSString * content = [self checkArgument:call.arguments forKey:@"content" ofType:[NSString class]];
//               [TalkingDataSDK onCredit:profile amount:amount.intValue content:content];
//           }else if([@"onChargeBack" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * orderId = [self checkArgument:call.arguments forKey:@"orderId" ofType:[NSString class]];
//               NSString * reason = [self checkArgument:call.arguments forKey:@"reason" ofType:[NSString class]];
//               NSString * type = [self checkArgument:call.arguments forKey:@"type" ofType:[NSString class]];
//               [TalkingDataSDK onChargeBack:profile orderId:orderId reason:reason type:type];
//           }else if ([@"onCreateRole" isEqualToString:call.method]){
//               NSString * name = [self checkArgument:call.arguments forKey:@"name" ofType:[NSString class]];
//               [TalkingDataSDK onCreateRole:name];
//           }else if([@"onTrialFinished" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * content = [self checkArgument:call.arguments forKey:@"content" ofType:[NSString class]];
//               [TalkingDataSDK onTrialFinished:profile content:content];
//           }else if([@"onGuideFinished" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * content = [self checkArgument:call.arguments forKey:@"content" ofType:[NSString class]];
//               [TalkingDataSDK onGuideFinished:profile content:content];
//           }else if([@"onPreviewFinished" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * content = [self checkArgument:call.arguments forKey:@"content" ofType:[NSString class]];
//               [TalkingDataSDK onPreviewFinished:profile content:content];
//           }else if([@"onFreeFinished" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * content = [self checkArgument:call.arguments forKey:@"content" ofType:[NSString class]];
//               [TalkingDataSDK onFreeFinished:profile content:content];
//           }else if([@"onLevelPass" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * levelId = [self checkArgument:call.arguments forKey:@"levelId" ofType:[NSString class]];
//               [TalkingDataSDK onLevelPass:profile levelId:levelId];
//           }else if([@"onAchievementUnlock" isEqualToString:call.method]){
//               NSString * profile = [self checkArgument:call.arguments forKey:@"profile" ofType:[NSString class]];
//               NSString * achievementId = [self checkArgument:call.arguments forKey:@"achievementId" ofType:[NSString class]];
//               [TalkingDataSDK onAchievementUnlock:profile achievementId:achievementId];
//           }
           else if ([@"getPlatformVersion" isEqualToString:call.method]) {
               result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
           }else if ([@"getDeviceID" isEqualToString:call.method]){
              NSString * deviceid = [TalkingDataSDK getDeviceId];
               NSLog(@"OC getDeviceID:%@",deviceid);
              result(deviceid);
           } else {
          result(FlutterMethodNotImplemented);
      }
}

@end


