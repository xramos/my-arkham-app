//
//  PackDetailView.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import SwiftUI

struct PackDetailView: View {
    
    @StateObject var viewModel: PackDetailViewModel
    
    var body: some View {
        
        // TODO: Add CardType filter
        
        VStack(alignment: .center) {
            
            Image("logo")
                .resizable()
                .frame(width: 300, height: 100, alignment: .center)
            
            ScrollView {
                
                ForEach(viewModel.cards) { card in
                    
                    CardCellView(card: card)
                }
            }
            
        }.onAppear {
            
            viewModel.getCards()
        }
    }
}

struct PackDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let pack = Pack(id: 1,
                        name: "name",
                        code: "code",
                        position: 0,
                        cyclePosition: 0,
                        available: "available",
                        total: 1)
        PackDetailView(viewModel: PackDetailViewModel(pack: pack))
    }
}
