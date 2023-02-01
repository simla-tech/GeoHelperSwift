//
//  DistrictsFilter.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Фильтр районов
public struct DistrictsFilter: Encodable, GeoHelperFilter {

    /// Идентификатор района
    public var id: District.ID?

    /// Массив внешних идентификаторов регионов
    ///
    /// Пример для поиска по коду ФИАС:
    ///
    /// `filter.externalIds["fias"] = ["XXX"]`
    public var externalIds: [String: [String]]?

    /// Массив идентификаторов районов
    public var ids: [District.ID]?

    /// Идентификатор города
    public var cityId: City.ID?

    /// Имя или часть имени
    public var name: String?

    public init() { }

}
