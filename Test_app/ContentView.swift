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
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                usernameField(username: $username)
                    .disableAutocorrection(true)
                    .textContentType(/*@START_MENU_TOKEN@*/.nickname/*@END_MENU_TOKEN@*/)
                    
                passwordField(password: $password)
                    .textContentType(.postalCode)
                Button(action: {
                    let concantenate_of_strings = self.password + self.username + uuid
                    print( concantenate_of_strings )
                    let hashed = concantenate_of_strings.sha256()
                    print(hashed)
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

import Foundation
import CommonCrypto

extension Data{
    public func sha256() -> String{
        return hexStringFromData(input: digest(input: self as NSData))
    }
    
    private func digest(input : NSData) -> NSData {
        let digestLength = Int(CC_SHA256_DIGEST_LENGTH)
        var hash = [UInt8](repeating: 0, count: digestLength)
        CC_SHA256(input.bytes, UInt32(input.length), &hash)
        return NSData(bytes: hash, length: digestLength)
    }
    
    private  func hexStringFromData(input: NSData) -> String {
        var bytes = [UInt8](repeating: 0, count: input.length)
        input.getBytes(&bytes, length: input.length)
        
        var hexString = ""
        for byte in bytes {
            hexString += String(format:"%02x", UInt8(byte))
        }
        
        return hexString
    }
}

public extension String {
    func sha256() -> String{
        if let stringData = self.data(using: String.Encoding.utf8) {
            return stringData.sha256()
        }
        return ""
    }
}
