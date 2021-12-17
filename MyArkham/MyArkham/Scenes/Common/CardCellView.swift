//
//  CardCellView.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import SwiftUI

struct CardCellView: View {
    
    var card: Card?
    
    init(card: Card) {
        
        self.card = card
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text(card?.name ?? "")
                
                Spacer()
                
                Text(card?.typeName ?? "")
                    .foregroundColor(Color.gray)
            }
            
            Divider()
        }
        .padding([.leading, .trailing], 16)
        .frame(height: 44)
    }
}

struct CardCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let card = Card(id: "1",
                        code: "code",
                        name: "name",
                        realName: "realName",
                        subname: nil,
                        text: nil,
                        realText: nil,
                        packCode: "code",
                        packName: "name",
                        factionCode: "code",
                        factionName: "name",
                        typeCode: "code",
                        typeName: "name",
                        subtypeCode: nil,
                        subtypeName: nil,
                        position: 1,
                        exceptional: false,
                        cost: nil,
                        xp: nil,
                        quantity: 1,
                        skillWillpower: nil,
                        skillIntelect: nil,
                        skillCombat: nil,
                        skillAgility: nil,
                        skillWild: nil,
                        healthPerInvestigator: false,
                        health: nil,
                        sanity: nil,
                        deckLimit: nil,
                        slot: nil,
                        realSlot: nil,
                        traits: nil,
                        realTraits: nil,
                        deckOptions: nil,
                        flavor: nil,
                        isUnique: false,
                        permanent: false,
                        doubleSided: false,
                        backText: nil,
                        backFlavor: nil,
                        imagesrc: nil,
                        backimagesrc: nil,
                        duplicatedBy: nil)
        CardCellView(card: card)
    }
}
