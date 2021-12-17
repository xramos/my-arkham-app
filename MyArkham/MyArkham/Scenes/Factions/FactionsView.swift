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
            
            Image("logo")
                .resizable()
                .frame(width: 300, height: 100, alignment: .center)
            
            ScrollView {
                
                if viewModel.showProgressView {
                    
                    ProgressView("Loading")
                }
                
                ForEach(viewModel.factions) { faction in
                    
                    FactionCellView(faction: faction)
                }
            }
            
        }.onAppear {
            
            viewModel.getCards()
        }
    }
}

struct FactionsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        FactionsView(viewModel: FactionsViewModel())
    }
}
