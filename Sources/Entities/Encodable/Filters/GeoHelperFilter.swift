//
//  GeoHelperFilter.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Протокол с вспомогательными методами для инициализации фильтов
public protocol GeoHelperFilter {
    init()
}

public extension GeoHelperFilter {

    /// DSL инициализация фильтра
    ///
    /// `let citiesFilter = CitiesFilter({ $0.name = "Москва" })`
    init(_ handler: (inout Self) -> Void) {
        self.init()
        handler(&self)
    }

    /// DSL инициализация фильтра
    ///
    /// `let citiesFilter: CitiesFilter = .with({ $0.name = "Москва" })`
    static func with(_ handler: (inout Self) -> Void) -> Self {
        Self(handler)
    }

}
