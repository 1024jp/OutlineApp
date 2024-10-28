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
        
        List($items, selection: $selection) { item in
            if let children = Binding<[Item]>(item.children) {
                DisclosureGroup(isExpanded: item.isExpanded) {
                    ForEach(children) { child in
                        TextField(text: child.name, label: EmptyView.init)
                    }
                    .onMove { (from, to) in
                        children.wrappedValue.move(fromOffsets: from, toOffset: to)
                    }
                } label: {
                    TextField(text: item.name, label: EmptyView.init)
                }
                
            } else {
                TextField(text: item.name, label: EmptyView.init)
            }
        }
    }
}


// MARK: - Preview

#Preview {
    @Previewable @State var items = Item.sampleItems

    return ListView(items: $items)
}
