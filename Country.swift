//
//  Country.swift
//  Mobile_dev_1_final_project
//
//  Created by Chou-Ping Ding on 28.4.2023.
//

import Foundation

struct Country: Identifiable, Codable {
    //initialization of the basic country struct of variables
    let id = UUID()
    
    var code: String
    var name: String
    var area: Int
    var population: Int
    var populationDensity: Int {
        return self.population / self.area
    }
    var isMember: Bool
    var isEuroZone: Bool
    var isSchengen: Bool
    
    enum CodingKeys: String, CodingKey {
        case code
        case name
        case area
        case population
        case isMember
        case isEuroZone
        case isSchengen
    }
    
}
