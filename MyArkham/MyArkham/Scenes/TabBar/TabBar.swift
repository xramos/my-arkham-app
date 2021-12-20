//
//  TabBar.swift
//  MyArkham
//
//  Created by Xavi on 20/12/21.
//

import SwiftUI

struct TabBar: View {
    
    @State var activeTab: Tab = .packs
    
    init() {
        
        updateApperance()
    }
    
    var body: some View {
        
        TabView(selection: $activeTab) {
                    
            PacksView(viewModel: PacksViewModel())
                .tabItem {
                    Text("Packs")
                }
                .tag(Tab.packs)
            
            FactionsView(viewModel: FactionsViewModel())
                .tabItem {
                    Text("Factions")
                }
                .tag(Tab.factions)
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension TabBar {
    
    func updateApperance() {
        
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        
        UINavigationBar.appearance().tintColor = UIColor.white
    }
}

struct TabBar_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TabBar()
    }
}
