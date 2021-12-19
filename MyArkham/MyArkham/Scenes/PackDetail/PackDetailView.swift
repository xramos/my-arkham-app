//
//  PackDetailView.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import SwiftUI

struct PackDetailView: View {
    
    @StateObject var viewModel: PackDetailViewModel
    @State private var selection = "all"
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            Image("logo")
                .resizable()
                .frame(width: 300, height: 100, alignment: .center)
            
            HStack {
                
                Spacer()
                
                Text("Filter by Card Type: ")
                    .bold()
                
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

struct PackDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let pack = Pack(id: "1",
                        name: "name",
                        code: "code",
                        position: 0,
                        cyclePosition: 0,
                        available: "available",
                        total: 1)
        PackDetailView(viewModel: PackDetailViewModel(pack: pack))
    }
}
