//
//  DisclosureListView.swift
//  OutlineApp
//
//  Created by 1024jp on 2024-10-27.
//

import SwiftUI

struct DisclosureListView: View {
    
    @Binding var items: [Item]
    
    @State private var selection: Set<Item.ID> = []
    
    
    var body: some View {
        
        List(selection: $selection) {
            Section("Animal") {
                ForEach($items) { item in
                    RowView(item: item)
                }
            }
        }
        
        // If you don't need section headers, you can simply write as follows.
//        List($items, selection: $selection) { item in
//            RowView(item: item)
//        }
    }
}


private struct RowView: View {
    
    @Binding var item: Item
    
    
    var body: some View {
        
        if let children = Binding<[Item]>($item.children) {
            DisclosureGroup(isExpanded: $item.isExpanded) {
                ForEach(children) { child in
                    RowView(item: child)
                }
            } label: {
                TextField(text: $item.name, label: EmptyView.init)
            }
        } else {
            TextField(text: $item.name, label: EmptyView.init)
        }
    }
}


// MARK: - Preview

#Preview {
    @Previewable @State var items = Item.sampleItems

    return DisclosureListView(items: $items)
}
