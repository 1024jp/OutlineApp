//
//  ContentView.swift
//  OutlineApp
//
//  Created by 1024jp on 2024-10-27.
//

import SwiftUI

struct ContentView: View {
    
    @State var items: [Item] = Item.sampleItems
    
    
    var body: some View {
        
        Grid(verticalSpacing: 20) {
            GridRow {
                VStack(alignment: .leading) {
                    Text("List")
                        .font(.title3)
                    ListView(items: $items)
                }
                VStack(alignment: .leading) {
                    Text("List – Disclosure")
                        .font(.title3)
                    DisclosureListView(items: $items)
                }
                VStack(alignment: .leading) {
                    Text("List – Outline Group")
                        .font(.title3)
                    OutlineGroupView(items: $items)
                }
            }
            
            GridRow {
                VStack(alignment: .leading) {
                    HStack(alignment: .firstTextBaseline) {
                        Text("Table")
                            .font(.title3)
                        Spacer()
                        Text("(Can't edit items.)")
                            .foregroundStyle(.secondary)
                            .controlSize(.small)
                    }
                    TableView(items: $items)
                }
                VStack(alignment: .leading) {
                    Text("Table – Disclosure")
                        .font(.title3)
                    DisclosureTableView(items: $items)
                }
            }
        }
        .scenePadding()
    }
}


// MARK: - Preview

#Preview {
    ContentView()
}
