//
//  ActionViewController.m
//  ActionExt
//
//  Created by xk on 2019/07/09.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "ActionViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

ActionViewController * actionViewController = nil;

@implementation ActionViewController

RCT_EXPORT_MODULE(ActionExtension);

RCT_EXPORT_METHOD(done) {
  [actionViewController.extensionContext completeRequestReturningItems:self.extensionContext.inputItems completionHandler:nil];
  actionViewController = nil;
}
  
- (void)loadView {
  NSURL *jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"extension" fallbackResource:nil];
  
  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"RNActionExtension"
                                               initialProperties:nil
                                                   launchOptions:nil];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
  self.view = rootView;
  actionViewController= self;
}

+ (BOOL)requiresMainQueueSetup {
  return YES;
}

@end
