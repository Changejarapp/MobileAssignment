//
//  ContentViewModel.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation

@MainActor
class ContentViewModel : ObservableObject {
    
    private let apiService = ApiService()
    @Published var navigateDetail: DeviceData? = nil
    @Published var data: [DeviceData]? = []

    func  fetchAPI() async {
//        apiService.fetchDeviceDetails(completion: { item in
//            self.data = item
//        })
        do{
            data =  try await apiService.fetchDeviceDetails()

        }
        catch {
            print("error")
        }
    }
    
    func navigateToDetail(navigateDetail: DeviceData) {
        self.navigateDetail = navigateDetail
    }
}
