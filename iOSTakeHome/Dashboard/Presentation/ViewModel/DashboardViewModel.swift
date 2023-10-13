//
//  DashboardViewModel.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 12/10/23.
//

import Combine

protocol DashboardViewModelProtocol: ObservableObject {
    var mealArray: [MealListModel] { get set }
    func fetchMealList()
}

final class DashboardViewModel: DashboardViewModelProtocol {
    @Published var mealArray = [MealListModel]()
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    private let fetchMealListUseCase: FetchMealListUseCaseProtocol

    init(fetchMealListUseCase: FetchMealListUseCaseProtocol) {
        self.fetchMealListUseCase = fetchMealListUseCase
    }

    func fetchMealList() {
        if NetworkManager.isConnected() {
            fetchMealListUseCase
                .execute()
                .sink(receiveCompletion: { result in
                    // TODO: Do something about error management
                    switch result {
                    case .failure:
                        break
                    default:
                        break
                    }
                }, receiveValue: { [weak self] mealList in
                    guard let self = self else { return }
                    self.mealArray.append(contentsOf: mealList)
                }).store(in: &bag)
        } else {
            // TODO: Show no connection alert
        }
    }
}

extension DashboardViewModel {
    static func make() -> DashboardViewModel {
        let serviceManager = ServiceManager()
        let repository = DashboardRepository(serviceManager: serviceManager)
        let fetchMealListUseCase = FetchMealListUseCase(repository: repository)
        return DashboardViewModel(fetchMealListUseCase: fetchMealListUseCase)
    }
}
