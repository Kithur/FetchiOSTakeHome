//
//  IngredientListView.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 13/10/23.
//

import SwiftUI

struct IngredientListView: View {
    let model: IngredientListModel

    init(model: IngredientListModel) {
        self.model = model
    }

    var body: some View {
        VStack {
            ForEach(Array(model.ingredients.enumerated()), id: \.offset) { index, ingredient in
                IngredientView(ingredient: ingredient, measure: model.measures[index])
            }
        }
    }
}

#Preview {
    IngredientListView(model: IngredientListModel(meal: MealDetailModel()))
}
