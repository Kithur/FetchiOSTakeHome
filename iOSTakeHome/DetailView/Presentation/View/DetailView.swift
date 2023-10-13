//
//  DetailView.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 13/10/23.
//

import SwiftUI

struct DetailView<ViewModelProtocol: DetailViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModelProtocol

    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
            case .success:
                if let meal = viewModel.mealDetailModel {
                    MealDetailView(meal: meal)
                }
            case .failure:
                VStack {
                    Text("Meal not found.")
                        .font(.title)
                }
            }
        }
        .onAppear {
            viewModel.fetchMeal()
        }
        .navigationTitle(viewModel.mealDetailModel?.name.capitalized ?? "")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel.make(id: "53049"))
}
