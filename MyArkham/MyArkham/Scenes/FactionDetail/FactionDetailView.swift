//
//  FactionDetailView.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import SwiftUI

struct FactionDetailView: View {
    
    @StateObject var viewModel: FactionDetailViewModel
    @State private var selection = "all"
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            HStack {
                
                Spacer()
                
                HStack {
                    
                    Text("Filter by Card Type: ")
                    
                    Picker("Filter by Card Type", selection: $selection) {
                        
                        ForEach (CardType.allCases, id: \.self, content: { type in
                            
                            Text(type.rawValue)
                                .tag(type.rawValue)
                        })
                    }.onChange(of: selection) { _ in
                        
                        viewModel.sortByType(selection)
                    }
                }
                .background(Color.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 16)
            }
            
            ScrollView {
                
                ForEach(viewModel.cards) { card in
                    
                    CardCellView(card: card)
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
