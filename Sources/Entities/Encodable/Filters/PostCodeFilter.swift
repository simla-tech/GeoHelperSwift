//
//  PostCodeFilter.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Фильтр почтового индекса
public struct PostCodeFilter: Encodable, GeoHelperFilter {

    /// Идентификатор города
    public var cityId: City.ID?

    /// Идентификатор улицы
    public var streetId: Street.ID?

    /// Номер дома
    public var houseNumber: String?

    /// Корпус
    public var housingNumber: String?

    /// Строение
    public var structureNumber: String?

    public init() { }

}
