//
//  ListView.swift
//  OutlineApp
//
//  Created by 1024jp on 2024-10-27.
//

import SwiftUI

struct ListView: View {
    
    @Binding var items: [Item]
    
    @State private var selection: Set<Item.ID> = []
    
    
    var body: some View {
        
        List($items, children: \.children, selection: $selection) { item in
            TextField(text: item.name, label: EmptyView.init)
        }
    }
}


// MARK: - Preview

#Preview {
    @Previewable @State var items = Item.sampleItems
    
    return ListView(items: $items)
}
