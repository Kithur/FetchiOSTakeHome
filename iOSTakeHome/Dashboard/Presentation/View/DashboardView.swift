//
//  DashboardView.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 12/10/23.
//

import SwiftUI

struct DashboardView<ViewModelProtocol:DashboardViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModelProtocol

    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.mealArray, id: \.self) { meal in
                    MealListView(model: meal)
                }
                .onAppear {
                    viewModel.fetchMealList()
                }
                .navigationTitle("Desserts")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    DashboardView(viewModel: DashboardViewModel.make())
}
