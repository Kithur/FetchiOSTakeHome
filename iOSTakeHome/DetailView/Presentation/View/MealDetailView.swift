//
//  MealDetailView.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 13/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MealDetailView: View {
    private var meal: MealDetailModel

    init(meal: MealDetailModel) {
        self.meal = meal
    }

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

#Preview {
    MealDetailView(meal: MealDetailModel())
}
