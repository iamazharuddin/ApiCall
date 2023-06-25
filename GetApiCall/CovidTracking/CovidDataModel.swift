//
//  CovidDataModel.swift
//  GetApiCall
//
//  Created by Azharuddin 1 on 11/05/23.
//

import Foundation
struct DailyStateData: Decodable{
    let identifier = UUID()
    let state: String
    let positive: Int?
    let death: Int?
    
    
    enum CodingKeys : String, CodingKey{
         case state
         case positive
         case death
    }
}
