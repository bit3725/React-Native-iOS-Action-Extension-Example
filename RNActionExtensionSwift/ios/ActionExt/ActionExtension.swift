//
//  ActionExtension.swift
//  ActionExt
//
//  Created by xk on 2019/07/11.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation

@objc(ActionExtension)
class ActionExtension: NSObject {
  static var viewController: ActionViewController?
  
  @objc
  func done() {
    if let viewController = ActionExtension.viewController {
      if let extensionContext = viewController.extensionContext {
          extensionContext.completeRequest(returningItems: extensionContext.inputItems, completionHandler: nil)
      }
    }
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
