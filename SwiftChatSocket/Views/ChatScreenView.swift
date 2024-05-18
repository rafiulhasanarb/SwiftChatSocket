//
//  ChatScreenView.swift
//  SwiftChatSocket
//
//  Created by rafiul hasan on 18/5/24.
//

import SwiftUI
import Combine

struct ChatScreenView: View {
    
    @EnvironmentObject private var userInfo: UserInfo
    @StateObject private var model = ChatScreenModel()
    @State private var message = ""
    
    var body: some View {
        VStack {
            // Chat history.
            ScrollView {
                ScrollViewReader{ proxy in
                    LazyVStack(spacing: 8) {
                        ForEach(model.messages) { message in
                            ChatMessageRow(message: message, isUser: message.userID == userInfo.userID)
                                .id(message.id)
                        }
                    }
                    .padding(10)
                    .onChange(of: model.messages.count) { _ in
                        scrollToLastMessage(proxy: proxy)
                    }
                }
            }
            
            // Message field.
            HStack {
                TextField("Message", text: $message, onEditingChanged: { _ in }, onCommit: onCommit)
                    .padding(10)
                    .background(Color.secondary.opacity(0.2))
                    .cornerRadius(5)
                
                Button(action: onCommit) {
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.system(size: 20))
                        .padding(6)
                }
                .cornerRadius(5)
                .disabled(message.isEmpty)
                .hoverEffect(.highlight)
            }
            .padding()
        }
        .navigationTitle("Chat")
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
    }
    
    // MARK: - Events
    private func onAppear() {
        model.connect(username: userInfo.username, userID: userInfo.userID)
    }
    
    private func onDisappear() {
        model.disconnect()
    }
    
    private func onCommit() {
        if !message.isEmpty {
            model.send(text: message)
            message = ""
        }
    }
    
    private func scrollToLastMessage(proxy: ScrollViewProxy) {
        if let lastMessage = model.messages.last {
            withAnimation(.easeOut(duration: 0.4)) {
                proxy.scrollTo(lastMessage.id, anchor: .bottom)
            }
        }
    }
    
}

struct ChatScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreenView()
    }
}
