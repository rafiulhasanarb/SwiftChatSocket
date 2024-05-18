//
//  UserInfo.swift
//  SwiftChatSocket
//
//  Created by rafiul hasan on 18/5/24.
//

import Combine
import Foundation

class UserInfo: ObservableObject {
    let userID = UUID()
    @Published var username = ""
}
