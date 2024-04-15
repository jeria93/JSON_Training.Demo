//
//  Screen2.swift
//  JSON_Training
//
//  Created by Nicholas Gaete Jeria on 2024-04-15.
//

import SwiftUI

struct Screen2: View {
    

    @Environment(FamilyTree.self) private var con
    
    var body: some View {
        

        VStack {
            
            
            
            Image(con.user.image1)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150, alignment: .center)
            
            Button(action: {
                
                con.user.image1 = "Seat2"
                
//                if con.user.image == "Seat2" || con.user.image == "Volvo1" {
//                    
//                    con.user.image = "Volvo2"
//                    con.user.image = "Seat1"
//                    
//                }
                
                
                
                
                
            }, label: {
                Text("Change car color")
            }).buttonStyle(.borderedProminent)
            
            
        }.onAppear(perform: {
            con.fetch()
        })

            
            
        }
    }

#Preview("Screen 2") {
    Screen2().environment(FamilyTree())
}
