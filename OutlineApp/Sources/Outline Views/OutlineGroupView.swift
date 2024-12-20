//
//  OutlineGroupView.swift
//  OutlineApp
//
//  Created by imanishi on 2024/10/27.
//

import SwiftUI

struct OutlineGroupView: View {
    
    @Binding var items: [Item]
    
    @State private var selection: Set<Item.ID> = []
    
    
    var body: some View {
        
        List(selection: $selection) {
            Section("Animal") {
                OutlineGroup($items, children: \.children) { item in
                    TextField(text: item.name, label: EmptyView.init)
                }
            }
        }
    }
}


// MARK: - Preview

#Preview {
    @Previewable @State var items = Item.sampleItems
    
    return OutlineGroupView(items: $items)
}
