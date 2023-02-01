//
//  GeoHelper+AsyncRequests.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Alamofire
import Foundation

public extension GeoHelper {

    private func createBaseRequest<T: Decodable>(for route: RequestRoute) async throws -> T {
        do {
            return try await self.session
                .request(route)
                .validate(validateError)
                .serializingDecodable(T.self)
                .value
        } catch let error as AFError {
            throw mapError(error)
        } catch {
            throw error
        }
    }

    /// Список стран
    /// - Parameters:
    ///   - filter: Фильтр
    ///   - pagination: Настройки пагинации
    ///   - order: Сортировка
    /// - Returns: Список стран
    func countries(
        filter: CountriesFilter? = nil,
        pagination: PaginationInput? = nil,
        order: OrderInput? = nil
    ) async throws -> PaginatedResponse<Country> {
        let route: RequestRoute = .countries(filter: filter, pagination: pagination, order: order)
        return try await self.createBaseRequest(for: route)
    }

    /// Список регионов
    /// - Parameters:
    ///   - filter: Фильтр
    ///   - pagination: Настройки пагинации
    ///   - order: Сортировка
    /// - Returns: Список регионов
    func regions(
        filter: RegionsFilter? = nil,
        pagination: PaginationInput? = nil,
        order: OrderInput? = nil
    ) async throws -> PaginatedResponse<Region> {
        let route: RequestRoute = .regions(filter: filter, pagination: pagination, order: order)
        return try await self.createBaseRequest(for: route)
    }

    /// Список городов
    /// - Parameters:
    ///   - filter: Фильтр
    ///   - pagination: Настройки пагинации
    ///   - order: Сортировка
    /// - Returns: Список городов
    func cities(
        filter: CitiesFilter? = nil,
        pagination: PaginationInput? = nil,
        order: OrderInput? = nil
    ) async throws -> PaginatedResponse<City> {
        let route: RequestRoute = .cities(filter: filter, pagination: pagination, order: order)
        return try await self.createBaseRequest(for: route)
    }

    /// Список районов
    /// - Parameters:
    ///   - filter: Фильтр
    ///   - pagination: Настройки пагинации
    ///   - order: Сортировка
    /// - Returns: Список районов
    func districts(
        filter: DistrictsFilter? = nil,
        pagination: PaginationInput? = nil,
        order: OrderInput? = nil
    ) async throws -> PaginatedResponse<District> {
        let route: RequestRoute = .districts(filter: filter, pagination: pagination, order: order)
        return try await self.createBaseRequest(for: route)
    }

    /// Список улиц
    /// - Parameters:
    ///   - filter: Фильтр
    ///   - pagination: Настройки пагинации
    ///   - order: Сортировка
    /// - Returns: Список улиц
    func streets(
        filter: StreetsFilter? = nil,
        pagination: PaginationInput? = nil,
        order: OrderInput? = nil
    ) async throws -> PaginatedResponse<Street> {
        let route: RequestRoute = .streets(filter: filter, pagination: pagination, order: order)
        return try await self.createBaseRequest(for: route)
    }

    /// Почтовый индекс
    /// - Parameters:
    ///   - filter: Фильтр
    /// - Returns: Ответ сервера
    func postCode(
        filter: PostCodeFilter? = nil
    ) async throws -> GeoHelperResponse<String> {
        let route: RequestRoute = .postCode(filter: filter)
        return try await self.createBaseRequest(for: route)
    }

    /// Поиск гео-объекта по данным стороннего сервиса
    /// - Parameters:
    ///   - filter: Фильтр
    ///   - pagination: Настройки пагинации
    ///   - order: Сортировка
    /// - Returns: Ответ сервера
    func serviceLocality(
        filter: ServiceLocalityFilter? = nil,
        pagination: PaginationInput? = nil,
        order: OrderInput? = nil
    ) async throws -> PaginatedResponse<ServiceLocality> {
        let route: RequestRoute = .serviceLocality(filter: filter, pagination: pagination, order: order)
        return try await self.createBaseRequest(for: route)
    }

    /// Получение часового пояса по телефону
    /// - Parameters:
    ///   - phone: Номер телефона
    /// - Returns: Ответ сервера
    func phoneData(phone: String) async throws -> GeoHelperResponse<PhoneData> {
        let filter = PhoneDataFilter(phone: phone)
        let route: RequestRoute = .phoneData(filter: filter)
        return try await self.createBaseRequest(for: route)
    }

}
