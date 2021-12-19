//
//  FactionsView.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import SwiftUI

struct FactionsView: View {
    
    @StateObject var viewModel: FactionsViewModel
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            ScrollView {
                
                ForEach(viewModel.factions) { faction in
                    
                    NavigationLink(destination: FactionDetailView(viewModel: FactionDetailViewModel(faction: faction))) {
                        
                        FactionCellView(faction: faction)
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
        .background(Color.clear)
        .withBackground(showLogo: true)
        .withProgressView(showProgressView: viewModel.showProgressView)
    }
}

struct FactionsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        FactionsView(viewModel: FactionsViewModel())
    }
}
