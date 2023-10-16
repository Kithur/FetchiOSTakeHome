//
//  DashboardEntities.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 12/10/23.
//

import Foundation
// MARK: - Decoding Entities
struct MealList: Codable {
    let meals: [ResultMeal]
}

struct ResultMeal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

// MARK: - Internal Entities
struct MealListModel: Hashable {
    let name: String
    let imageURL: URL?
    let id: String
}

// MARK: - Initializers Extension
extension MealListModel {
    init(resultMeal: ResultMeal) {
        name = resultMeal.strMeal
        imageURL = URL(string: resultMeal.strMealThumb)
        id = resultMeal.idMeal
    }

    init() {
        name = "Apam balik"
        imageURL = URL(string: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        id = "53049"
    }
}
