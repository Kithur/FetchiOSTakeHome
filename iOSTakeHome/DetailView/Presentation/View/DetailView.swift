//
//  DetailView.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 13/10/23.
//

import SwiftUI
// MARK: DetailView struct
struct DetailView<ViewModelProtocol: DetailViewModelProtocol>: View {
    // MARK: - Properties
    @ObservedObject var viewModel: ViewModelProtocol

    // MARK: - Initializers
    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
    }

    // MARK: - body
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

// MARK: - Preview
#Preview {
    DetailView(viewModel: DetailViewModel.make(id: "53049"))
}
