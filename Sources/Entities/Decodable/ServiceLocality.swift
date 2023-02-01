//
//  ServiceLocality.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Гео-объект в стророннем сервисе
public struct ServiceLocality: Decodable {

    /// Внутренний идентификатор гео-объекта в geohelper
    public let innerId: Int?

    /// Страна
    public let country: Country

    /// Код стороннего сервиса
    public let service: String

    /// Идентификатор в стороннем сервисе
    public let externalId: String

    /// Наименование объекта
    public let name: String

    /// Тип объекта
    public let localityType: ServiceLocalityType

    /// Наименование типа объекта
    public let localityTypeName: String?

    /// Дополнительные данные объекта
    public let customData: GeoHelperDictionary<String, String>?

}
