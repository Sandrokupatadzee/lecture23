//
//  CatFact.swift
//  lecture23
//
//  Created by MacBook Pro on 03.05.24.
//

import Foundation


struct CatFact: Codable {
    let data: [Fact]
    
}

struct Fact: Codable {
    let fact: String?
    let length: Int?
    
}




