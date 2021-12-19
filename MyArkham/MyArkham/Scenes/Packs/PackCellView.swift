//
//  PackCellView.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import SwiftUI

struct PackCellView: View {
    
    var pack: Pack?
    
    init(pack: Pack) {
        
        self.pack = pack
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text(pack?.name ?? "")
                
                Spacer()
                
                Text(pack?.available ?? "")
                    .foregroundColor(Color.gray)
            }
            
            Divider()
        }
        .padding([.leading, .trailing], 16)
        .frame(height: 44)
    }
}

struct PackCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let pack = Pack(id: "1",
                        name: "name",
                        code: "code",
                        position: 1,
                        cyclePosition: 1,
                        available: "available",
                        total: 40)
        PackCellView(pack: pack)
    }
}
