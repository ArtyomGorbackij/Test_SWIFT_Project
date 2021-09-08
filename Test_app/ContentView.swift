//
//  ContentView.swift
//  Test_app
//
//  Created by Артем on 06.09.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .stroke(lineWidth: 3)

                .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            
            Text("Hello, world!")
                .foregroundColor(.orange)
        })
        .padding(.horizontal)

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
