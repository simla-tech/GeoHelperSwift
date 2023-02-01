//
//  CitiesFilter.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Фильтр регионов
public struct CitiesFilter: Encodable, GeoHelperFilter {

    /// ISO код страны (ISO 3166-1 alpha-2)
    public var countryIso: String?

    /// Идентификатор города
    public var id: City.ID?

    /// Массив внешних идентификаторов регионов
    ///
    /// Пример для поиска по коду ФИАС:
    ///
    /// `filter.externalIds["fias"] = ["XXX"]`
    public var externalIds: [String: [String]]?

    /// Массив идентификаторов городов
    public var ids: [City.ID]?

    /// Имя или часть имени
    public var name: String?

    /// ISO код языка по которому будет вестись поиск по имени (ISO 639-1)
    public var nameStrictLanguage: String?

    /// Идентификатор региона
    public var regionId: Region.ID?

    /// Словарь кодов региона (regionCodes[iso]=RU-KYA)
    public var regionCodes: [String: String]?

    public init() { }

}
