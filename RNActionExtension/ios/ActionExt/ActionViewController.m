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

ActionViewController *actionViewController = nil;

@implementation ActionViewController

RCT_EXPORT_MODULE(ActionExtension);

RCT_EXPORT_METHOD(done) {
  [actionViewController.extensionContext completeRequestReturningItems:self.extensionContext.inputItems completionHandler:nil];
  actionViewController = nil;
}

RCT_REMAP_METHOD(getData,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSExtensionContext *extensionContext = actionViewController.extensionContext;
  NSExtensionItem *item = [extensionContext.inputItems firstObject];
  NSArray *attachments = item.attachments;
  NSItemProvider *itemProvider = [attachments firstObject];
  if ([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypeURL]) {
    [itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypeURL options:nil completionHandler:^(NSURL *url, NSError *error) {
      if (error) {
        reject(@"error", @"Load url failed", error);
      } else {
        resolve(@{
                  @"type": @"URL",
                  @"value": [url absoluteString]
                  });
      }
    }];
  } else if ([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypeImage]) {
    [itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypeImage options:nil completionHandler:^(NSURL *imageUrl, NSError *error) {
      if (error) {
        reject(@"error", @"Load image failed", error);
      } else {
        resolve(@{
                  @"type": @"IMAGE",
                  @"value": [imageUrl absoluteString]
                  });
      }
    }];
  } else if ([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypeText]) {
    [itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypeText options:nil completionHandler:^(NSString *text, NSError *error) {
      if (error) {
        reject(@"error", @"Load text failed", error);
      } else {
        resolve(@{
                  @"type": @"TEXT",
                  @"value": text
                  });
      }
    }];
  } else {
    reject(@"error", @"Unsupported Type", nil);
  }
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
