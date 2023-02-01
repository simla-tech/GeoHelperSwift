//
//  GeoHelper+ClosureRequests.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Alamofire
import Foundation

public extension GeoHelper {

    private func createBaseRequest<T: Decodable>(for route: RequestRoute, completion: @escaping (Result<T, Error>) -> Void) {
        self.session
            .request(route)
            .validate(validateError)
            .responseDecodable(of: T.self, completionHandler: {
                completion(mapResponse(response: $0))
            })
    }

    /// Список стран
    /// - Parameters:
    ///   - filter: Фильтр
    ///   - pagination: Настройки пагинации
    ///   - order: Сортировка
    ///   - completion: Список стран
    func countries(
        filter: CountriesFilter? = nil,
        pagination: PaginationInput? = nil,
        order: OrderInput? = nil,
        completion: @escaping (Result<PaginatedResponse<Country>, Error>) -> Void
    ) {
        let route: RequestRoute = .countries(filter: filter, pagination: pagination, order: order)
        self.createBaseRequest(for: route, completion: completion)
    }

    /// Список регионов
    /// - Parameters:
    ///   - filter: Фильтр
    ///   - pagination: Настройки пагинации
    ///   - order: Сортировка
    ///   - completion: Список регионов
    func regions(
        filter: RegionsFilter? = nil,
        pagination: PaginationInput? = nil,
        order: OrderInput? = nil,
        completion: @escaping (Result<PaginatedResponse<Region>, Error>) -> Void
    ) {
        let route: RequestRoute = .regions(filter: filter, pagination: pagination, order: order)
        self.createBaseRequest(for: route, completion: completion)
    }

    /// Список городов
    /// - Parameters:
    ///   - filter: Фильтр
    ///   - pagination: Настройки пагинации
    ///   - order: Сортировка
    ///   - completion: Список городов
    func cities(
        filter: CitiesFilter? = nil,
        pagination: PaginationInput? = nil,
        order: OrderInput? = nil,
        completion: @escaping (Result<PaginatedResponse<City>, Error>) -> Void
    ) {
        let route: RequestRoute = .cities(filter: filter, pagination: pagination, order: order)
        self.createBaseRequest(for: route, completion: completion)
    }

    /// Список районов
    /// - Parameters:
    ///   - filter: Фильтр
    ///   - pagination: Настройки пагинации
    ///   - order: Сортировка
    ///   - completion: Список районов
    func districts(
        filter: DistrictsFilter? = nil,
        pagination: PaginationInput? = nil,
        order: OrderInput? = nil,
        completion: @escaping (Result<PaginatedResponse<District>, Error>) -> Void
    ) {
        let route: RequestRoute = .districts(filter: filter, pagination: pagination, order: order)
        self.createBaseRequest(for: route, completion: completion)
    }

    /// Список улиц
    /// - Parameters:
    ///   - filter: Фильтр
    ///   - pagination: Настройки пагинации
    ///   - order: Сортировка
    ///   - completion: Список улиц
    func streets(
        filter: StreetsFilter? = nil,
        pagination: PaginationInput? = nil,
        order: OrderInput? = nil,
        completion: @escaping (Result<PaginatedResponse<Street>, Error>) -> Void
    ) {
        let route: RequestRoute = .streets(filter: filter, pagination: pagination, order: order)
        self.createBaseRequest(for: route, completion: completion)
    }

    /// Почтовый индекс
    /// - Parameters:
    ///   - filter: Фильтр
    ///   - completion: Ответ сервера
    func postCode(
        filter: PostCodeFilter? = nil,
        completion: @escaping (Result<GeoHelperResponse<String>, Error>) -> Void
    ) {
        let route: RequestRoute = .postCode(filter: filter)
        self.createBaseRequest(for: route, completion: completion)
    }

    /// Поиск гео-объекта по данным стороннего сервиса
    /// - Parameters:
    ///   - filter: Фильтр
    ///   - pagination: Настройки пагинации
    ///   - order: Сортировка
    ///   - completion: Ответ сервера
    func serviceLocality(
        filter: ServiceLocalityFilter? = nil,
        pagination: PaginationInput? = nil,
        order: OrderInput? = nil,
        completion: @escaping (Result<PaginatedResponse<ServiceLocality>, Error>) -> Void
    ) {
        let route: RequestRoute = .serviceLocality(filter: filter, pagination: pagination, order: order)
        self.createBaseRequest(for: route, completion: completion)
    }

    /// Получение часового пояса по телефону
    /// - Parameters:
    ///   - phone: Номер телефона
    ///   - completion: Ответ сервера
    func phoneData(
        phone: String,
        completion: @escaping (Result<GeoHelperResponse<PhoneData>, Error>) -> Void
    ) {
        let filter = PhoneDataFilter(phone: phone)
        let route: RequestRoute = .phoneData(filter: filter)
        self.createBaseRequest(for: route, completion: completion)
    }

}
