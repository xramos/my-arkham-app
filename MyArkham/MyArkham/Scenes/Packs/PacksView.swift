//
//  PacksView.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import SwiftUI

struct PacksView: View {
    
    @StateObject var viewModel: PacksViewModel
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            Image("logo")
                .resizable()
                .frame(width: 300, height: 100, alignment: .center)
            
            ScrollView {
                
                if viewModel.showProgressView {
                    
                    ProgressView("Loading")
                }
                
                ForEach(viewModel.packs) { pack in
                    
                    Text(pack.name)
                }
            }
            
        }.onAppear {
            
            viewModel.getPacks()
        }
    }
}

struct PacksView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PacksView(viewModel: PacksViewModel())
    }
}
