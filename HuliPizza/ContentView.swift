//
//  ContentView.swift
//  HuliPizza
//
//  Created by chamuel castillo on 10/2/23.
//

import SwiftUI

struct ContentView: View {
    var menu: [MenuItem]
    @StateObject var orders: OrderModel = OrderModel()
    @State var showOrders: Bool = false
    @State var presentGrid: Bool = false
    @State private var selectedItem: MenuItem = noMenuItem
    var body: some View {
        TabView {
            VStack{
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                
                StatusBarView(showOrders: $showOrders, showGrid: $presentGrid)
                
//                MenuItemView(item: $selectedItem, orders: orders)
//                    .padding(5)
//                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
//                if presentGrid {
//                    MenuGridView(menu: menu, selectedItem: $selectedItem)
//                } else {
//                    
//                    MenuView(menu: menu, selectedItem: $selectedItem)
//                }
                MenuView2(menu: menu)
            }.tabItem {
                Label("Menu", systemImage: "list.bullet")
            }
            VStack{
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(showOrders: $showOrders, showGrid: $presentGrid)
                
                OrderView(orders: orders)
                    .cornerRadius(10)
                
            }.tabItem {
                Label("Order", systemImage: "cart")
            }
            
//            Spacer()
        }
        .padding()
        .background(.linearGradient(colors: [.cyan, Color("Surf"), .white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)
    }
}

#Preview {
    ContentView(menu: MenuModel().menu)
}
