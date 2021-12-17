//
//  FactionDetailView.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import SwiftUI

struct FactionDetailView: View {
    
    @StateObject var viewModel: FactionDetailViewModel
    
    var body: some View {
        
        // TODO: Add CardType filter
        
        VStack(alignment: .center) {
            
            Image("logo")
                .resizable()
                .frame(width: 300, height: 100, alignment: .center)
            
            ScrollView {
                
                ForEach(viewModel.cards) { card in
                    
                    FactionCardCellView(card: card)
                }
            }
            
        }.onAppear {
            
            viewModel.getCards()
        }
    }
}

struct FactionDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let faction = Faction(id: "1",
                              code: "code",
                              name: "name",
                              isPrimary: true)
        FactionDetailView(viewModel: FactionDetailViewModel(faction: faction))
    }
}
