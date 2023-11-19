//
//  File.swift
//
//
//  Created by Mariam Mchedlidze on 20.11.23.
//

import Foundation

// MARK: - Welcome
public struct CatsResponse: Decodable {
    public   let data: [Cats]
    
}

// MARK: - Datum
public struct Cats: Decodable {
    let fact: String
    
    enum CodingKeys: String, CodingKey {
        case fact
    }
}
