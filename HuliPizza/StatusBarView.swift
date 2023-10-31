//
//  StatusBarView.swift
//  HuliPizza
//
//  Created by chamuel castillo on 10/25/23.
//

import SwiftUI

struct StatusBarView: View {
    @EnvironmentObject var orders: OrderModel
    @Binding var showOrders: Bool
    @Binding var showGrid: Bool
    var body: some View {
        HStack {
            Text("\(orders.orderItems.count) orders")
            Spacer()
            Button{
                showOrders.toggle()
            } label: {
                Image(systemName: showOrders ? "cart" : "menucard")
            }
            if !showOrders {
                Button{
                    showGrid.toggle()
                } label: {
                    Image(systemName: showGrid ? "list.bullet" : "square.grid.3x2")
                }
            }
            Spacer()
            Label {
                Text(orders.orderTotal, format: .currency(code: "USD"))
            }
        icon: {
            Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
        }
        }
        .foregroundStyle(.white)
        .font(.title2)
    }
}

#Preview {
    StatusBarView( showOrders: .constant(false), showGrid: .constant(false)).environmentObject(OrderModel())
        .background(.black)
}
