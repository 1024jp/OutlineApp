//
//  DisclosureTableView.swift
//  OutlineApp
//
//  Created by 1024jp on 2024-10-27.
//

import SwiftUI

struct DisclosureTableView: View {
    
    @Binding var items: [Item]
    
    @State private var selection: Set<Item.ID> = []
    @State private var sortOrder: [KeyPathComparator<Binding<Item>>] = []
    @State private var columnCustomization: TableColumnCustomization<Binding<Item>> = .init()
    
    
    var body: some View {
        
        Table(of: Binding<Item>.self, selection: $selection, sortOrder: $sortOrder, columnCustomization: $columnCustomization) {
            TableColumn("Name", value: \.name.wrappedValue) {
                TextField(text: $0.name, label: EmptyView.init)
            }
            .customizationID("name")
            
            TableColumn("ID", value: \.id) {
                Text($0.id.uuidString)
                    .foregroundStyle(.secondary)
            }
            .customizationID("id")
            
        } rows: {
            ForEach($items) { item in
                if let children = Binding<[Item]>(item.children) {
                    DisclosureTableRow(item, isExpanded: item.isExpanded) {
                        ForEach(children) { child in
                            TableRow(child)
                        }
                    }
                } else {
                    TableRow(item)
                }
            }
        }
        .onChange(of: self.sortOrder) { (_, newValue) in
            // FIXME: unwrap sort order
            let unwrappedOrder: [KeyPathComparator<Item>] = []
            self.items.sort(using: unwrappedOrder)
        }
    }
}


// MARK: - Preview

#Preview {
    @Previewable @State var items = Item.sampleItems
    
    return DisclosureTableView(items: $items)
}
