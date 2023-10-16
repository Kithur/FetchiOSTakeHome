//
//  Endpoint.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 12/10/23.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var url: String { get }
    func getFinalURL() -> URL?
}

enum MealRequest {
    case list
    case id(_ id: String)
}

extension MealRequest: Endpoint {
    var base: String {
        return "https://themealdb.com/api/json/v1/1/"
    }

    var url: String {
        switch self {
        case .list:
            return "\(base)filter.php?c=Dessert"
        case .id(let id):
            return "\(base)lookup.php?i=\(id)"
        }
    }

    func getFinalURL() -> URL? {
        return URL(string: url)
    }
}
