//
//  OpenGraphData.swift
//  RunnerTools
//
//  Created by Jake Smith on 10/4/22.
//

import Foundation

struct OpenGraphData: Decodable {
    let title: String
    let image: String
    let description: String
    
    static let example = OpenGraphData(title: "no-title", image: "no-image", description: "no-description")
}
