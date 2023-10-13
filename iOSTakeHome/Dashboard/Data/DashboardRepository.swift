//
//  DashboardRepository.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 12/10/23.
//

import Combine

protocol DashboardRepositoryProtocol {
    func fetchMealList() -> AnyPublisher<[MealListModel], Error>
}

final class DashboardRepository: DashboardRepositoryProtocol {
    private let serviceManager: APIService

    init(serviceManager: APIService) {
        self.serviceManager = serviceManager
    }

    func fetchMealList() -> AnyPublisher<[MealListModel], Error> {
        serviceManager
            .fetch(from: .list, decodedType: MealList.self)
            .compactMap({ $0.meals.map { meal in
                return MealListModel(resultMeal: meal)
            }
            .sorted(by: { $0.name < $1.name })
            })
            .mapError({ $0 as Error })
            .eraseToAnyPublisher()
    }
}
