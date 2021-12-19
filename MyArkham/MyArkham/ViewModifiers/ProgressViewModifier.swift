//
//  ProgressViewModifier.swift
//  MyArkham
//
//  Created by Xavi on 19/12/21.
//

import SwiftUI

public struct ProgressViewModifier: ViewModifier {

    var showProgressView: Bool
    var width: CGFloat
    var height: CGFloat

    public func body(content: Content) -> some View {
        
        ZStack {
            
            content
            
            if showProgressView {
                
                LottieView().frame(width: width, height: height)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

public extension View {
    
    func withProgressView(showProgressView: Bool,
                          width: CGFloat = 100,
                          height: CGFloat = 100) -> some View {
        
        self.modifier(ProgressViewModifier(showProgressView: showProgressView,
                                           width: width,
                                           height: height))
    }
}
