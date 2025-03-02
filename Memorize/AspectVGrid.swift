//
//  AspectVGrid.swift
//  Memorize
//
//  Created by 大大怪将军 on 2025/3/2.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var aspectRatio: CGFloat = 1
    var content: (Item ) -> ItemView
    
    init(_ items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFits(count: items.count, size: geometry.size, atAspectRatio: aspectRatio )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize),spacing: 0)],spacing: 0){
                ForEach(items) { item in
                    content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
    }
    
    func gridItemWidthThatFits(count: Int, size: CGSize, atAspectRatio aspectRatio: CGFloat) -> CGFloat {
        let count = CGFloat(count)
        var colunmCount = 1.0
        repeat {
            let width = size.width / colunmCount
            let height = width / aspectRatio
            
            let rowCount = (count / colunmCount).rounded(.down)
            if rowCount * height < size.height {
                return (size.width / colunmCount).rounded(.down)
            }
            colunmCount += 1
        } while colunmCount < count
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
}

