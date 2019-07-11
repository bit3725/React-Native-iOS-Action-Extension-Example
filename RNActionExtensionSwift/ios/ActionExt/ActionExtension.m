//
//  ActionExtension.m
//  ActionExt
//
//  Created by xk on 2019/07/11.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ActionExtension, NSObject)

RCT_EXTERN_METHOD(done)

RCT_EXTERN_METHOD(getData: (RCTPromiseResolveBlock)resolve
                  rejecter: (RCTPromiseRejectBlock)reject
                  )

@end
