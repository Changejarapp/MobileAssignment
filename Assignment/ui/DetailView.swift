//
//  DetailView.swift
//  Assignment
//
//  Created by Kunal on 03/01/25.
//

import SwiftUI

struct DetailView: View {
    let device: DeviceData

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(device.name)
                .font(.largeTitle)
                .bold()
            
            if let data = device.data {
                if let price = data.price {
                    Text("Price: $\(price, specifier: "%.2f")")
                        .font(.title2)
                        .padding(.top, 8)
                }
                if data.price == nil {
                    Text("Price: $not found")
                        .font(.title2)
                        .padding(.top, 8)
                }
                if let screenSize = data.screenSize {
                    Text("Screen Size: \(screenSize)\"")
                }
                if data.screenSize == nil {
                    Text("screenSize: not found")
                        .font(.title2)
                        .padding(.top, 8)
                }
                if let capacity = data.capacity {
                    Text("Capacity: \(capacity)")
                }
                if data.capacity == nil {
                    Text("Capacity: not found")
                        .font(.title2)
                        .padding(.top, 8)
                }
                if let description = data.description {
                    Text("Description: \(description)")
                        .padding(.top, 8)
                }
                if data.description == nil {
                    Text("description: not found")
                        .font(.title2)
                        .padding(.top, 8)
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
