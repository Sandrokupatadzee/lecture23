//
//  CatFactCellViewModel.swift
//  lecture23
//
//  Created by MacBook Pro on 03.05.24.
//

import Foundation

struct CatFactTableViewCellViewModel {
    
    private var fact: Fact
    init(fact: Fact) {
        self.fact = fact
    }
    
    var catFactText: String {
        return fact.fact ?? ""  
    }
}
