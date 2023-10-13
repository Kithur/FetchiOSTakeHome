//
//  IngredientView.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 13/10/23.
//

import SwiftUI

struct IngredientView: View {
    private let ingredient: String
    private let measure: String

    init(ingredient: String, measure: String) {
        self.ingredient = ingredient
        self.measure = measure
    }

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

#Preview {
    IngredientView(ingredient: "Milk", measure: "200ml")
}
