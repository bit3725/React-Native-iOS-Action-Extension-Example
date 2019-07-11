//
//  ActionExtension.swift
//  ActionExt
//
//  Created by xk on 2019/07/11.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation
import MobileCoreServices

@objc(ActionExtension)
class ActionExtension: NSObject {
  static var viewController: ActionViewController?
  
  @objc
  func done() {
    if let viewController = ActionExtension.viewController, let extensionContext = viewController.extensionContext {
      extensionContext.completeRequest(returningItems: extensionContext.inputItems, completionHandler: nil)
    }
  }
  
  @objc
  func getData(
    _ resolve: @escaping RCTPromiseResolveBlock,
    rejecter reject: @escaping RCTPromiseRejectBlock
    ) {
    if let viewController = ActionExtension.viewController, let extensionContext = viewController.extensionContext {
      let extensionItem: NSExtensionItem
      let itemProvider: NSItemProvider
      extensionItem = extensionContext.inputItems[0] as! NSExtensionItem
      itemProvider = extensionItem.attachments![0]
      if itemProvider.hasItemConformingToTypeIdentifier(kUTTypeURL as String) {
        itemProvider.loadItem(forTypeIdentifier: kUTTypeURL as String, options: nil, completionHandler: { (url, error) in
          OperationQueue.main.addOperation {
            if let url = url as? NSURL {
              resolve([
                "type": "URL",
                "value": url.absoluteString
                ]);
            } else {
              reject("error", "Load url failed", error);
            }
          }
        })
      } else if itemProvider.hasItemConformingToTypeIdentifier(kUTTypeImage as String) {
        itemProvider.loadItem(forTypeIdentifier: kUTTypeImage as String, options: nil, completionHandler: { (imageUrl, error) in
          OperationQueue.main.addOperation {
            if let imageUrl = imageUrl as? NSURL {
              resolve([
                "type": "IMAGE",
                "value": imageUrl.absoluteString
                ]);
            } else {
              reject("error", "Load image failed", error);
            }
          }
        })
      } else if itemProvider.hasItemConformingToTypeIdentifier(kUTTypeText as String) {
        itemProvider.loadItem(forTypeIdentifier: kUTTypeText as String, options: nil, completionHandler: { (text, error) in
          OperationQueue.main.addOperation {
            if let text = text as? String {
              resolve([
                "type": "TEXT",
                "value": text
                ]);
            } else {
              reject("error", "Load text failed", error);
            }
          }
        })
      } else {
        reject("error", "Unsupported Type", nil);
      }
    } else {
      reject("error", "Unsupported Type", nil);
    }
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
