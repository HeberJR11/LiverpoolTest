//
//  ResponseModel.swift
//  Liverpooltest
//
//  Created by NinoDev on 28/02/24.
//
// xlImage
// productDisplayName
// listPrice
// promoPrice

import Foundation
import SwiftUI

struct ResponseModel: Codable {
    
    var status: Status
    var pageType: String
    var plpResults: PlpResults
    var nullSearch: String
}

struct Status: Codable {
    
    var status: String
    var statusCode: Int
}

struct PlpResults: Codable {
    
    let records: [Product]
}

struct Product: Codable {
    
    let productId: String
    let xlImage: String
    let productDisplayName: String
    let listPrice: Int
    let promoPrice: Double
}
