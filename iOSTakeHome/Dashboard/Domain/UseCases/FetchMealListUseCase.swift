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

final class FetchMealListUseCase: FetchMealListUseCaseProtocol {
    private let repository: DashboardRepositoryProtocol

    init(repository: DashboardRepositoryProtocol) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[MealListModel], Error> {
        return repository.fetchMealList()
    }
}
