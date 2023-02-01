//
//  LocalityType.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Тип гео объекта
public struct LocalityType: Decodable {

    /// Код
    public let code: String

    /// Имя типа
    public let name: String?

    /// Словарь коротких локализованных имен - [languageIsoCode: localizedName]
    public let localizedNamesShort: GeoHelperDictionary<String, String>?

    /// Словарь локализованных имен - [languageIsoCode: localizedName]
    public let localizedNames: GeoHelperDictionary<String, String>?

}
