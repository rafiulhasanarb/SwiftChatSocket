//
//  SubmittedChatMessage.swift
//  SwiftChatSocket
//
//  Created by rafiul hasan on 18/5/24.
//

import Foundation

struct SubmittedChatMessage: Encodable {
    let message: String
    let user: String
    let userID: UUID
}

struct ReceivingChatMessage: Decodable, Identifiable {
    let date: Date
    let id: UUID
    let message: String
    let user: String
    let userID: UUID
}
