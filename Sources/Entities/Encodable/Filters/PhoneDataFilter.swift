//
//  PhoneDataFilter.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Фильтр для получение часового пояса по телефону
internal struct PhoneDataFilter: Encodable {

    /// Телефон
    internal let phone: String

}
