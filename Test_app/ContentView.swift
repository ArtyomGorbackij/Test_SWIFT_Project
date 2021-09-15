//
//  ContentView.swift
//  Test_app
//
//  Created by Артем on 06.09.2021.
//

import SwiftUI

let uuid = UUID().uuidString

struct ContentView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var concantenate_of_strings: String = ""
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                usernameField(username: $username)
                    .disableAutocorrection(true)
                    .textContentType(/*@START_MENU_TOKEN@*/.nickname/*@END_MENU_TOKEN@*/)
                    
                passwordField(password: $password)
                    .textContentType(.postalCode)
                Button(action: {
                    self.concantenate_of_strings += uuid + self.username + self.password
                    print( concantenate_of_strings )
                }) {
                        Text("Button")
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct usernameField: View {
    
    @Binding var username: String
    
    var body: some View {
        TextField("Username", text: $username)
            .padding(.all)
    }
}
 
struct passwordField: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding(.all)
    }
}
