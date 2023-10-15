//
//  FetchMealListUseCase.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 12/10/23.
//

import Combine

protocol FetchMealListUseCaseProtocol {
    func execute() -> AnyPublisher<[MealListModel], Error>
}

// MARK: - FetchMealListUseCase class
final class FetchMealListUseCase: FetchMealListUseCaseProtocol {
    // MARK: - Properties
    private let repository: DashboardRepositoryProtocol

    // MARK: - Initializers
    init(repository: DashboardRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Methods
    func execute() -> AnyPublisher<[MealListModel], Error> {
        return repository.fetchMealList()
    }
}
