//
//  MyArkhamApp.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import SwiftUI

@main
struct MyArkhamApp: App {

    var body: some Scene {
        
        WindowGroup {
            
            NavigationView {
            
                FactionsView(viewModel: FactionsViewModel())
                //PacksView(viewModel: PacksViewModel())
            }
        }
    }
}
