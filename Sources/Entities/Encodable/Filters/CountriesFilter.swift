//
//  CountriesFilter.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Фильтр стран
public struct CountriesFilter: Encodable, GeoHelperFilter {

    /// Имя или часть имени
    public var name: String?

    /// ISO код (ISO 3166-1 alpha-2)
    public var iso: String?

    /// 3-х символьный ISO3 код (ISO 3166-1 alpha-3)
    public var iso3: String?

    /// fips код
    public var fips: String?

    public init() { }

}
