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
        
        VStack {
            
            ScrollView {
                
                ForEach(viewModel.packs) { pack in
                    
                    NavigationLink(destination: PackDetailView(viewModel: PackDetailViewModel(pack: pack))) {
                        
                        PackCellView(pack: pack)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding([.leading, .trailing], 16)
            
        }.onAppear {
            
            viewModel.getCards()
        }
        .navigationBarTitle("")
        .navigationTitle("")
        .background(Color.clear)
        .withBackground(showLogo: true)
        .withProgressView(showProgressView: viewModel.showProgressView)
    }
}

struct PacksView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PacksView(viewModel: PacksViewModel())
    }
}
