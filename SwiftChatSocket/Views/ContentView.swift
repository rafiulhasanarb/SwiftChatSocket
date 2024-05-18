//
//  ContentView.swift
//  SwiftChatSocket
//
//  Created by rafiul hasan on 18/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var userInfo = UserInfo()
    
    var body: some View {
        NavigationView {
            SettingsScreenView()
        }
        .environmentObject(userInfo)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
