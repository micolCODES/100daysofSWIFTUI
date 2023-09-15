//
//  Misson.swift
//  Moonshot
//
//  Created by Micol on 15.09.23.
//

import Foundation

struct Mission : Codable, Identifiable {
    
    struct CrewRole : Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    
}
