//
//  CovidDataViewModel.swift
//  GetApiCall
//
//  Created by Azharuddin 1 on 11/05/23.
//

import Foundation
enum Loading {
    case initial
    case loading
}

class StateDataViewModel: ObservableObject {
    @Published var state: Result<[DailyStateData], Error> = .success([])
    @Published var loading: Loading = .initial
    
    private let apiCallManager = APICallManager()
    
    func fetchDailyStateData() {
        self.state = .success([])
        self.loading = .loading
        guard let url = URL(string: "https://api.covidtracking.com/v1/states/daily.json") else { return }
        apiCallManager.fetchData(url: url, type : [DailyStateData].self ) { result in
            DispatchQueue.main.async {
                 self.state = result
                 self.loading = .initial
            }
        }
    }
}
