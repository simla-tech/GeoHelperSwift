//
//  RequestRouter.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Alamofire
import Foundation

internal enum RequestRoute {

    case countries(filter: CountriesFilter?, pagination: PaginationInput?, order: OrderInput?)
    case regions(filter: RegionsFilter?, pagination: PaginationInput?, order: OrderInput?)
    case cities(filter: CitiesFilter?, pagination: PaginationInput?, order: OrderInput?)
    case districts(filter: DistrictsFilter?, pagination: PaginationInput?, order: OrderInput?)
    case streets(filter: StreetsFilter?, pagination: PaginationInput?, order: OrderInput?)
    case postCode(filter: PostCodeFilter?)
    case serviceLocality(filter: ServiceLocalityFilter?, pagination: PaginationInput?, order: OrderInput?)
    case phoneData(filter: PhoneDataFilter)

}

extension RequestRoute: URLRequestConvertible {

    var baseURL: URL {
        URL(string: "http://geohelper.info/api/v1")!
    }

    var path: String {
        switch self {
        case .countries: return "countries"
        case .regions: return "regions"
        case .cities: return "cities"
        case .districts: return "districts"
        case .streets: return "streets"
        case .postCode: return "post-code"
        case .serviceLocality: return "service-locality"
        case .phoneData: return "phone-data"
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = self.baseURL.appendingPathComponent(self.path)
        let request = URLRequest(url: url)

        switch self {
        case .countries(let filter, let pagination, let order):
            let input = FilterPaginationOrderInput(filter: filter, pagination: pagination, order: order)
            return try URLEncodedFormParameterEncoder().encode(input, into: request)

        case .regions(let filter, let pagination, let order):
            let input = FilterPaginationOrderInput(filter: filter, pagination: pagination, order: order)
            return try URLEncodedFormParameterEncoder().encode(input, into: request)

        case .cities(let filter, let pagination, let order):
            let input = FilterPaginationOrderInput(filter: filter, pagination: pagination, order: order)
            return try URLEncodedFormParameterEncoder().encode(input, into: request)

        case .districts(let filter, let pagination, let order):
            let input = FilterPaginationOrderInput(filter: filter, pagination: pagination, order: order)
            return try URLEncodedFormParameterEncoder().encode(input, into: request)

        case .streets(let filter, let pagination, let order):
            let input = FilterPaginationOrderInput(filter: filter, pagination: pagination, order: order)
            return try URLEncodedFormParameterEncoder().encode(input, into: request)

        case .postCode(let filter):
            let input = FilterInput(filter: filter)
            return try URLEncodedFormParameterEncoder().encode(input, into: request)

        case .serviceLocality(let filter, let pagination, let order):
            let input = FilterPaginationOrderInput(filter: filter, pagination: pagination, order: order)
            return try URLEncodedFormParameterEncoder().encode(input, into: request)

        case .phoneData(let filter):
            let input = FilterInput(filter: filter)
            return try URLEncodedFormParameterEncoder().encode(input, into: request)

        }
    }

}
