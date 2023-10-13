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

final class FetchMealUseCase: FetchMealUseCaseProtocol {
    private let repository: DetailViewRepositoryProtocol

    init(repository: DetailViewRepositoryProtocol) {
        self.repository = repository
    }

    func execute(id: String) -> AnyPublisher<MealDetailModel, Error> {
        repository
            .fetchMeal(id: id)
            .eraseToAnyPublisher()
    }
}
