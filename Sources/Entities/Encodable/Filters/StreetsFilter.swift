//
//  StreetsFilter.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Фильтр улиц
public struct StreetsFilter: Encodable, GeoHelperFilter {

    /// Идентификатор улицы
    public var id: Street.ID?

    /// Массив внешних идентификаторов регионов
    ///
    /// Пример для поиска по коду ФИАС:
    ///
    /// `filter.externalIds["fias"] = ["XXX"]`
    public var externalIds: [String: [String]]?

    /// Массив идентификаторов улиц
    public var ids: [Street.ID]?

    /// Идентификатор города
    public var cityId: City.ID?

    /// Имя или часть имени
    public var name: String?

    /// Код источника данных.
    /// Если в параметре cityId передан идентификатор города в источнике данных (пример - `fias`)
    public var cityExternalIdCode: String?

    public init() { }

}
