//
//  FactionCellView.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import SwiftUI

struct FactionCellView: View {
    
    var faction: Faction?
    
    init(faction: Faction) {
        
        self.faction = faction
    }
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            HStack {
                
                Text(faction?.name ?? "")
                
                Spacer()
            }
            
            Spacer()
            
            Divider().frame(height: 1)
        }
        .padding([.leading, .trailing], 16)
        .frame(height: 45)
    }
}

struct FactionCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let faction = Faction(id: "1",
                              code: "code",
                              name: "name",
                              isPrimary: true)
        FactionCellView(faction: faction)
    }
}
