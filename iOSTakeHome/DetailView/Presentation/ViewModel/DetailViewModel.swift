//
//  DetailViewModel.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 13/10/23.
//

import Combine

protocol DetailViewModelProtocol: ObservableObject {
    var mealDetailModel: MealDetailModel? { get set }
    var state: DetailViewState { get set }
    func fetchMeal()
}

enum DetailViewState {
    case loading
    case success
    case failure
}

// MARK: DetailViewModel class
final class DetailViewModel: DetailViewModelProtocol {
    // MARK: - Properties
    var mealDetailModel: MealDetailModel?
    @Published var state: DetailViewState = .loading
    private let id: String
    private let useCase: FetchMealUseCaseProtocol
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()

    // MARK: - Initializers
    init(id: String, useCase: FetchMealUseCaseProtocol) {
        self.id = id
        self.useCase = useCase
    }

    // MARK: - Methods
    func fetchMeal() {
        useCase
            .execute(id: id)
            .sink(receiveCompletion: { [weak self] result in
                switch result {
                case .failure:
                    self?.state = .failure
                case .finished:
                    self?.state = .success
                }
            }, receiveValue: { [weak self] meal in
                self?.mealDetailModel = meal
            }).store(in: &bag)
    }
}

// MARK: - Constructor Extension
extension DetailViewModel {
    static func make(id: String) -> DetailViewModel {
        let serviceManager = ServiceManager()
        let repository = DetailViewRepository(serviceManager: serviceManager)
        let useCase = FetchMealUseCase(repository: repository)
        return DetailViewModel(id: id, useCase: useCase)
    }
}
