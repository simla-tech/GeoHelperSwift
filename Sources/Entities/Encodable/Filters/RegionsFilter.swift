//
//  RegionsFilter.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Фильтр регионов
public struct RegionsFilter: Encodable, GeoHelperFilter {

    /// Идентификатор региона
    public var id: Region.ID?

    /// Массив внешних идентификаторов регионов
    ///
    /// Пример для поиска по коду ФИАС:
    ///
    /// `filter.externalIds["fias"] = ["XXX"]`
    public var externalIds: [String: [String]]?

    /// Массив идентификаторов регионов
    public var ids: [Region.ID]?

    /// Идентификатор города
    public var cityId: City.ID?

    /// Имя или часть имени
    public var name: String?

    /// ISO код страны (ISO 3166-1 alpha-2)
    public var countryIso: String?

    public init() { }

}
