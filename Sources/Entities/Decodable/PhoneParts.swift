//
//  PhoneParts.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Телефон, разбитый на части
public struct PhoneParts: Decodable {

    /// Код страны
    public let countryCode: String

    /// Код города, региона, мобильного оператора
    public let code: String

    /// Номер телефона без кодов
    public let number: String

}
