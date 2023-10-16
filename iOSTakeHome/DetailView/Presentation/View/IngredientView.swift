//
//  IngredientView.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 13/10/23.
//

import SwiftUI
// MARK: - IngredientView struct
struct IngredientView: View {
    // MARK: - Properties
    private let ingredient: String
    private let measure: String

    // MARK: - Initializers
    init(ingredient: String, measure: String) {
        self.ingredient = ingredient
        self.measure = measure
    }

    // MARK: - body
    var body: some View {
        HStack {
            Text(ingredient)
                .padding(.leading)
            Spacer()
            Text(measure)
                .padding(.trailing)
        }
    }
}

// MARK: - Preview
#Preview {
    IngredientView(ingredient: "Milk", measure: "200ml")
}
