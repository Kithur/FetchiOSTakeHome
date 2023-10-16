//
//  FetchMealUseCase.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 13/10/23.
//

import Combine

protocol FetchMealUseCaseProtocol {
    func execute(id: String) -> AnyPublisher<MealDetailModel, Error>
}

// MARK: FetchMealUseCase struct
final class FetchMealUseCase: FetchMealUseCaseProtocol {
    // MARK: - Properties
    private let repository: DetailViewRepositoryProtocol

    // MARK: - Initializers
    init(repository: DetailViewRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Methods
    func execute(id: String) -> AnyPublisher<MealDetailModel, Error> {
        repository
            .fetchMeal(id: id)
            .eraseToAnyPublisher()
    }
}
