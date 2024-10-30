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
            TableColumn("Name", value: \.name.wrappedValue) { item in
                TextField(text: item.name, label: EmptyView.init)
            }
            .customizationID("name")
            
            TableColumn("ID", value: \.id) { item in
                Text(item.id.uuidString)
                    .foregroundStyle(.secondary)
            }
            .customizationID("id")
            
        } rows: {
            RecursiveTableRows($items)
        }
        .onChange(of: self.sortOrder) { (_, newValue) in
            self.items.sort(using: newValue.map(\.unwrappedComparator))
        }
    }
}


private struct RecursiveTableRows: TableRowContent {
    
    @Binding var items: [Item]
    
    
    init(_ items: Binding<[Item]>) {
        
        self._items = items
    }
    
    
    var tableRowBody: some TableRowContent<Binding<Item>> {
        
        ForEach($items) { item in
            if let children = Binding(item.children) {
                DisclosureTableRow(item, isExpanded: item.isExpanded) {
                    RecursiveTableRows(children)
                }
            } else {
                TableRow(item)
            }
        }
    }
}


private extension KeyPathComparator<Binding<Item>> {
    
    /// Manually unwraps `Binding`.
    var unwrappedComparator: KeyPathComparator<Item> {
        
        switch self.keyPath {
            case \.name.wrappedValue: KeyPathComparator<Item>(\.name, order: self.order)
            case \.id: KeyPathComparator<Item>(\.id, order: self.order)
            default: fatalError()
        }
    }
}


// MARK: - Preview

#Preview {
    @Previewable @State var items = Item.sampleItems
    
    return DisclosureTableView(items: $items)
}
