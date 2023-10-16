//
//  DashboardView.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 12/10/23.
//

import SwiftUI
// MARK: - DashboardView struct
struct DashboardView<ViewModelProtocol: DashboardViewModelProtocol>: View {
    // MARK: - Properties
    @ObservedObject var viewModel: ViewModelProtocol
    @State var isShowingDetailView: Bool = false
    @State var mealId: String = ""
    @State var showingAlert: Bool = false

    // MARK: - Iniitializers
    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
    }

    // MARK: - body
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.mealArray, id: \.self) { meal in
                    MealListView(model: meal)
                        .onTapGesture {
                            showDetailView(mealId: meal.id)
                        }
                }
                .onAppear {
                    viewModel.fetchMealList()
                }
                .navigationTitle("Desserts")
                .navigationBarTitleDisplayMode(.inline)
            }
            .navigationDestination(isPresented: $isShowingDetailView) {
                DetailView(viewModel: DetailViewModel.make(id: mealId))
            }
        }
    }

    // MARK: - Private methods
    private func showDetailView(mealId: String) {
        guard NetworkManager.isConnected() else { return }
        self.mealId = mealId
        isShowingDetailView = true
    }
}
    // MARK: - Preview
#Preview {
    DashboardView(viewModel: DashboardViewModel.make())
}
