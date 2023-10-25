//
//  Following.swift
//  CatsAndDogs
//
//  Created by Vincent Villaflores on 24/10/2023.
//

import SwiftUI

struct Following: View {
    private var userStorage = UserStorage()
    
    var body: some View {
        VStack{
            let faves = userStorage.read()
            if (faves.isEmpty){
                Text("No Faves")
                Spacer()
                Text("0")
            }
            else{
                List(faves, id: \.self) { fave in
                    AsyncImage(url: URL(string:"https://picsum.photos/id/\(fave)/200/300"))
                }
                Text("\(faves.count)")
            }
        }
    }
}

#Preview {
    Following()
}
