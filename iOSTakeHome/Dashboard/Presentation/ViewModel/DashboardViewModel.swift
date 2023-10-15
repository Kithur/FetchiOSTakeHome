//
//  DashboardViewModel.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 12/10/23.
//

import Combine

protocol DashboardViewModelProtocol: ObservableObject {
    var mealArray: [MealListModel] { get set }
    var alertMessage : String { get set }
    var showingAlert: Bool { get set }
    func fetchMealList()
}

// MARK: - DashboardViewModel class
final class DashboardViewModel: DashboardViewModelProtocol {
    // MARK: - Properties
    @Published var mealArray = [MealListModel]()
    @Published var alertMessage = ""
    @Published var showingAlert = false
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    private let fetchMealListUseCase: FetchMealListUseCaseProtocol

    // MARK: - Initializers
    init(fetchMealListUseCase: FetchMealListUseCaseProtocol) {
        self.fetchMealListUseCase = fetchMealListUseCase
    }

    // MARK: - Methods
    func fetchMealList() {
        if NetworkManager.isConnected() {
            fetchMealListUseCase
                .execute()
                .sink(receiveCompletion: { result in
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

// MARK: - Constructor extension
extension DashboardViewModel {
    static func make() -> DashboardViewModel {
        let serviceManager = ServiceManager()
        let repository = DashboardRepository(serviceManager: serviceManager)
        let fetchMealListUseCase = FetchMealListUseCase(repository: repository)
        return DashboardViewModel(fetchMealListUseCase: fetchMealListUseCase)
    }
}
