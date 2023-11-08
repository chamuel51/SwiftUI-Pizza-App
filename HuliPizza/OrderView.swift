//
//  OrderView.swift
//  HuliPizza
//
//  Created by chamuel castillo on 10/5/23.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orders: OrderModel
    var body: some View {
        VStack {
            NavigationStack {
                List{
                    ForEach ($orders.orderItems){ $order in
                        NavigationLink(value:order){
                            OrderRowView(order: $order)
                                .padding(.bottom, 5)
                                .padding([.leading, .trailing], 7)
                                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 10)
                        }.navigationDestination(for: OrderItem.self) { order in
                            OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false))
                        }.navigationTitle("Your Order")
                    }
                    .onDelete { indexSet in
                        orders.orderItems.remove(atOffsets: indexSet)
                        
                    }
                    .onMove {source, destination in
                        orders.orderItems.move(fromOffsets: source, toOffset: destination)
                    }
                }
            }
//            .padding()
//            Button("Delete Order") {
//                if !orders.orderItems.isEmpty {
//                    orders.removeLast()
//                }
//            }
//            .padding(5)
//            .background(.regularMaterial, in: Capsule())
//            .padding(7)
        }
        .background(.regularMaterial)
    }
}

#Preview {
    OrderView(orders: OrderModel())
}
