//
//  TableView.swift
//  OutlineApp
//
//  Created by 1024jp on 2024-10-27.
//

import SwiftUI

struct TableView: View {
    
    @Binding var items: [Item]
    
    @State private var selection: Set<Item.ID> = []
    @State private var sortOrder: [KeyPathComparator<Item>] = []
    @State private var columnCustomization: TableColumnCustomization<Item> = .init()
    
    
    var body: some View {
        
        Table(self.items, children: \.children, selection: $selection, sortOrder: $sortOrder, columnCustomization: $columnCustomization) {
            TableColumn("Name", value: \.name) {
                Text($0.name)
            }
            .customizationID("name")
            
            TableColumn("ID", value: \.id) {
                Text($0.id.uuidString)
                    .foregroundStyle(.secondary)
            }
            .customizationID("id")
        }
        .onChange(of: self.sortOrder) { (_, newValue) in
            self.items.sort(using: newValue)
        }
    }
}


// MARK: - Preview

#Preview {
    @Previewable @State var items = Item.sampleItems
    
    return TableView(items: $items)
}
