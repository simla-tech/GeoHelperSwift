//
//  ServiceLocalityType.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Тип гео-объекта
public enum ServiceLocalityType: String, Codable {
    /// Страна
    case country
    /// Регион
    case region
    /// Город
    case city
}
