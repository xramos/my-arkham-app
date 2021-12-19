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
            
            Image("logo")
                .resizable()
                .frame(width: 300, height: 100, alignment: .center)
            
            HStack {
                
                Spacer()
                
                Text("Filter by Card Type: ")
                
                Picker("Filter by Card Type", selection: $selection) {
                                            
                    ForEach (CardType.allCases, id: \.self, content: { type in
                        
                        Text(type.rawValue)
                            .tag(type.rawValue)
                    })
                }.onChange(of: selection) { _ in
                    
                    viewModel.sortByType(selection)
                }
            }.padding([.trailing], 16)
            
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

struct FactionDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let faction = Faction(id: "1",
                              code: "code",
                              name: "name",
                              isPrimary: true)
        FactionDetailView(viewModel: FactionDetailViewModel(faction: faction))
    }
}
