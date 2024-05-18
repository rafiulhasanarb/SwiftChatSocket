//
//  SettingsScreenView.swift
//  SwiftChatSocket
//
//  Created by rafiul hasan on 18/5/24.
//

import SwiftUI

struct SettingsScreenView: View {
    
    @EnvironmentObject private var userInfo: UserInfo
    private var isUsernameValid: Bool {
        !userInfo.username.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        Form {
            Section(header: Text("Username")) {
                TextField("E.g. John Applesheed", text: $userInfo.username)
                
                NavigationLink("Continue", destination: ChatScreenView())
                    .disabled(!isUsernameValid)
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreenView()
    }
}
