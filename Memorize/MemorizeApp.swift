//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 大大怪将军 on 2025/1/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
