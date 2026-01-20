//
//  ContentView.swift
//  Assignment
//
//  Created by Kunal on 03/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var path: [DeviceData] = []// Navigation path
    @State private var search: String = ""

    var body: some View {
        NavigationStack(path: $path) {
            Group {
                TextField("Search device", text: $search)
                    .padding(.horizontal)
                if let computers = viewModel.data, !computers.isEmpty {
                    if !search.isEmpty{
//                        let filterdata = viewModel.data?.
                        DevicesList(devices: computers) { selectedComputer in
                            viewModel.navigateToDetail(navigateDetail: selectedComputer)
                        }

                    }
                    else{
                        DevicesList(devices: computers) { selectedComputer in
                            viewModel.navigateToDetail(navigateDetail: selectedComputer)
                        }
                    }
                } else {
                    ProgressView("Loading...")
                }
            }
            .onChange(of: viewModel.navigateDetail, {
                let navigate = viewModel.navigateDetail
                path.append(navigate!)
            })
            .onChange(of: search, { oldValue, newValue in
                print(newValue)
            })
            .navigationTitle("Devices")
            .navigationDestination(for: DeviceData.self) { computer in
                DetailView(device: computer)
            }
            .onAppear {
                let navigate = viewModel.navigateDetail
                if (navigate != nil) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        path.append(navigate!)
                    }
                }
                Task{
                    await viewModel.fetchAPI()
                }
            }
        }
    }
}
