//
//  BackgroundViewModifier.swift
//  MyArkham
//
//  Created by Xavi on 19/12/21.
//

import SwiftUI

struct BackgroundViewModifier: ViewModifier {
    
    var showLogo: Bool
    
    
    func body(content: Content) -> some View {
        
        ZStack {
            
            Color("launchScreenBackground")
                .ignoresSafeArea()
            
            VStack {
                
                if showLogo {
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 300, height: 100, alignment: .center)
                }
                
                content
            }
        }
    }
}

extension View {
    
    func withBackground(showLogo: Bool) -> some View {
        
        self.modifier(BackgroundViewModifier(showLogo: showLogo))
    }
}
