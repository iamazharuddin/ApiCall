//
//  CovidDataListView.swift
//  GetApiCall
//
//  Created by Azharuddin 1 on 11/05/23.
//

import SwiftUI

struct CovidDataListView : View {
    @StateObject var viewModel = StateDataViewModel()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .success(let dailyStateData):
                List(dailyStateData, id:\.identifier) { dailyData in
                    VStack(alignment: .leading) {
                        Text(dailyData.state)
                            .font(.headline)
                        Text("Positive cases: \(dailyData.positive ?? 0)")
                        Text("Deaths: \(dailyData.death ?? 0) ")
                    }
                }
            case .failure(let error):
                Text("Error: \(error.localizedDescription)")
            }
        }
        .overlay(
            Group {
                if viewModel.loading == .loading {
                    ProgressView()
                }
            }
        )
        .onAppear {
            viewModel.fetchDailyStateData()
        }
    }
}



//struct CovidDataListView: View {
//    @StateObject var vm = CovidDataViewModel()
//    var body: some View {
//        ScrollView{
//            LazyVStack{
//                ForEach(0..<vm.covidDataList.count){ i in
//                    let model = vm.covidDataList[i]
//                    VStack{
//                        HStack{
//                            Text(model.state)
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct CovidDataListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CovidDataListView()
//    }
//}
