//
//  DelegateAdaptor.swift
//  MyArkham
//
//  Created by Xavi on 19/12/21.
//

import Foundation
import UIKit

class DelegateAdaptor: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        
        return UIInterfaceOrientationMask.portrait
    }
}
