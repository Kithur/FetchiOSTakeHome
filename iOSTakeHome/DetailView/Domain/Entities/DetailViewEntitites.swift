//
//  DetailViewEntitites.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 13/10/23.
//

import Foundation

struct ResultMealDetailContainer: Codable {
    let meals: [ResultMealDetail]
}

struct ResultMealDetail: Codable {
    let strMeal: String
    let strMealThumb: String
    let strInstructions: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
    let strMeasure11: String
    let strMeasure12: String
    let strMeasure13: String
    let strMeasure14: String
    let strMeasure15: String
    let strMeasure16: String
    let strMeasure17: String
    let strMeasure18: String
    let strMeasure19: String
    let strMeasure20: String

    func getIngredients() -> [String] {
        let rawIngredients = [strIngredient1,
                              strIngredient2,
                              strIngredient3,
                              strIngredient4,
                              strIngredient5,
                              strIngredient6,
                              strIngredient7,
                              strIngredient8,
                              strIngredient9,
                              strIngredient10,
                              strIngredient11,
                              strIngredient12,
                              strIngredient13,
                              strIngredient14,
                              strIngredient15,
                              strIngredient16,
                              strIngredient17,
                              strIngredient18,
                              strIngredient19,
                              strIngredient20]
        var pointer = Int.zero
        var ingredients = [String]()
        while rawIngredients[pointer] != "",
              pointer < rawIngredients.count {
            ingredients.append(rawIngredients[pointer])
            pointer += 1
        }
        return ingredients
    }

    func getMeasures() -> [String] {
        let rawMeasures = [strMeasure1,
                              strMeasure2,
                              strMeasure3,
                              strMeasure4,
                              strMeasure5,
                              strMeasure6,
                              strMeasure7,
                              strMeasure8,
                              strMeasure9,
                              strMeasure10,
                              strMeasure11,
                              strMeasure12,
                              strMeasure13,
                              strMeasure14,
                              strMeasure15,
                              strMeasure16,
                              strMeasure17,
                              strMeasure18,
                              strMeasure19,
                              strMeasure20]
        var pointer = Int.zero
        var measures = [String]()
        while pointer < rawMeasures.count,
              rawMeasures[pointer] != " " {
            measures.append(rawMeasures[pointer])
            pointer += 1
        }
        return measures
    }
}

struct MealDetailModel {
    let name: String
    let imageURL: URL?
    let instructions: String
    let ingredients: [String]
    let measures: [String]
}

extension MealDetailModel {
    init(resultMealDetail: ResultMealDetail) {
        name = resultMealDetail.strMeal
        imageURL = URL(string: resultMealDetail.strMealThumb)
        instructions = resultMealDetail.strInstructions
        ingredients = resultMealDetail.getIngredients()
        measures = resultMealDetail.getMeasures()
    }

    init() {
        name = "Apam balik"
        imageURL = URL(string: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        instructions = "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm."
        ingredients = ["Milk",
                       "Oil",
                       "Eggs",
                       "Flour",
                       "Baking Powder",
                       "Salt",
                       "Unsalted Butter",
                       "Sugar",
                       "Peanut Butter"]
        measures = ["200ml",
                        "60ml",
                        "2",
                        "1600g",
                        "3 tsp",
                        "1/2 tsp",
                        "25g",
                        "45g",
                        "3 tbs"]
    }
}

struct IngredientListModel {
    let ingredients: [String]
    let measures: [String]

    func getUpperLimit() -> Int {
        return min(ingredients.count, measures.count)
    }
}

extension IngredientListModel {
    init(meal: MealDetailModel) {
        ingredients = meal.ingredients
        measures = meal.measures
    }
}
