//
//  ContentView.swift
//  JSON_Training
//
//  Created by Nicholas Gaete Jeria on 2024-04-13.
//

import SwiftUI

struct Screen1: View {
    
    @State var viewM = FamilyTree()
    
    var body: some View {
        
        NavigationStack {
            VStack {
               
                HStack {

                    Text(viewM.user.name)
                    Spacer()
                    Text(viewM.user.lastName)
                }.padding(.horizontal)
                
                List(viewM.user.otherFamily) { gen in
                    
                    NavigationLink {
                        Screen2()
                    } label: {
                        HStack {
                            
                            Text(gen.car)
                            Spacer()
                            Image(viewM.user.image1)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30, alignment: .center)
                            Text(gen.carColor)
                        }
                    }

                    
                }
                

                
            }.onAppear(perform: {
                viewM.fetch()
            })
            .padding()
        }.environment(FamilyTree())
    }
}

#Preview {
    Screen1()
}

var myJsonString = """


{
    "name": "Nicholas",
    "lastName": "Samuelsson Jeria",
    "image1": "Seat1",
    "otherFamily": [
        {
            "car": "Seat",
            "child": "1",
            "carColor": "White",
            "image": "Seat2"
            
        },
        {
            "car": "Volvo",
            "child": "0",
            "carColor": "Black",
            "image": "Volvo1"
        }
    ]
}

"""

struct Family1: Identifiable, Codable {
    
    let id = UUID()
    var name: String = ""
    var lastName: String = ""
    var image1: String = ""
    var otherFamily: [Family2]
    
    
}

struct Family2: Identifiable, Codable {
    
    let id = UUID()
    var car: String = ""
    var child: String = ""
    var carColor: String = ""
    var image: String = ""
    
    
}

@Observable
class FamilyTree {
    
    var user = Family1( otherFamily: [Family2]())
    var jsonError: Error?
    
    func fetch() {
        
        let data = myJsonString.data(using: .utf8)!
        
        do {
            
            user = try JSONDecoder().decode(Family1.self, from: data)
            
        } catch {
            
            jsonError = error
            print(error)
            
        }
    }
}
