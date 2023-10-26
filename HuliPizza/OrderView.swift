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
            ZStack(alignment: .top) {     
                ScrollView {
                    ForEach($orders.orderItems){ order in
                        OrderRowView(order: order)
//                        Text(order.item.name)
                            .padding(.bottom, 5)
                            .padding([.leading, .trailing], 7)
                            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                    }
                }
                .padding(.top, 70)
                HStack {
                    Text("Order Pizza")
                        .font(.title)
                    Spacer()

                }
                .padding()
                .background(.ultraThinMaterial)
            }
            .padding()
            Button("Delete Order") {
                if !orders.orderItems.isEmpty {
                    orders.removeLast()
                }
            }
            .padding(5)
            .background(.regularMaterial, in: Capsule())
            .padding(7)
        }
        .background(Color("Surf"))
    }
}

#Preview {
    OrderView(orders: OrderModel())
}
