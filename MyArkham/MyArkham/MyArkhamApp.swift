//
//  MyArkhamApp.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import SwiftUI

@main
struct MyArkhamApp: App {

    @UIApplicationDelegateAdaptor(DelegateAdaptor.self) var appDelegate: DelegateAdaptor
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView {
            
                TabBar()
            }
        }
    }
}
