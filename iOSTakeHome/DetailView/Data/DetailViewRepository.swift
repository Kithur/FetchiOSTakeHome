//
//  DetailViewRepository.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 13/10/23.
//

import Combine

protocol DetailViewRepositoryProtocol {
    func fetchMeal(id: String) -> AnyPublisher<MealDetailModel, Error>
}

final class DetailViewRepository: DetailViewRepositoryProtocol {
    private let serviceManager: APIService

    init(serviceManager: APIService) {
        self.serviceManager = serviceManager
    }

    func fetchMeal(id: String) -> AnyPublisher<MealDetailModel, Error> {
        serviceManager
            .fetch(from: .id(id), decodedType: ResultMealDetailContainer.self).map({ MealDetailModel(resultMealDetail: $0.meals[Int.zero]) })
            .mapError({ $0 as Error })
            .eraseToAnyPublisher()
    }
}
