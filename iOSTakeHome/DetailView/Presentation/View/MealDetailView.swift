//
//  MealDetailView.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 13/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: MealDetailView struct
struct MealDetailView: View {
    // MARK: - Properties
    private var meal: MealDetailModel

    // MARK: - Initializers
    init(meal: MealDetailModel) {
        self.meal = meal
    }

    // MARK: - body
    var body: some View {
        ScrollView {
            WebImage(url: meal.imageURL)
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 300.0, height: 300.0)
            .padding()
            Text("Instructions:")
                .font(.title)
            Text(meal.instructions)
                .padding()
            Text("Ingredients:")
                .font(.title)
            IngredientListView(model: IngredientListModel(meal: meal))
            Spacer()
        }
    }
}

// MARK: - Preview
#Preview {
    MealDetailView(meal: MealDetailModel())
}
