//
//  MealListView.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 12/10/23.
//

import SwiftUI
import SDWebImageSwiftUI
// MARK: - MealListView struct
struct MealListView: View {
    // MARK: - Properties
    var model: MealListModel

    // MARK: - body
    var body: some View {
        HStack {
            WebImage(url: model.imageURL)
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 64.0, height: 64.0)
            Text(model.name.capitalized)
                .font(.title)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}

// MARK: - Preview
#Preview {
    MealListView(model: MealListModel())
}
