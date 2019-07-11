//
//  ActionViewController.swift
//  ActionExt
//
//  Created by xk on 2019/07/11.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit

class ActionViewController: UIViewController {
  override func loadView() {
    let jsCodeLocation: URL
    let rootView: RCTRootView
    
    jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "extension", fallbackResource: nil)
    
    rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "RNActionExtensionSwift", initialProperties: nil, launchOptions: nil)
    self.view = rootView;
    
    ActionExtension.viewController = self;
  }
}
