//
//  IngredientListView.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 13/10/23.
//

import SwiftUI
// MARK: IngredientListView struct
struct IngredientListView: View {
    // MARK: - Properties
    let model: IngredientListModel

    // MARK: - Initializers
    init(model: IngredientListModel) {
        self.model = model
    }

    // MARK: - body
    var body: some View {
        VStack {
            ForEach(Array(model.ingredients.enumerated()), id: \.offset) { index, ingredient in
                IngredientView(ingredient: ingredient, measure: model.measures[index])
            }
        }
    }
}

// MARK: - Preview
#Preview {
    IngredientListView(model: IngredientListModel(meal: MealDetailModel()))
}
