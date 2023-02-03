//
//  Country.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Страна
public struct Country: Decodable, Identifiable {

    /// Автоинкрементальный идентификатор
    public let id: Int

    /// Имя страны
    public let name: String

    /// ISO код (ISO 3166-1 alpha-2)
    public let iso: String

    /// ISO3 код (ISO 3166-1 alpha-3)
    public let iso3: String

    /// isoNumeric код (ISO 3166-1 numeric)
    public let isoNumeric: String

    /// fips код
    public let fips: String

    /// Континет
    public let continent: String

    /// Валюта
    public let currencyCode: String

    /// Телефон
    public let phonePrefix: [String]?

    /// Формат почтового индекса
    public let postalCodeFormat: String?

    /// Формат почтового индекса (Regex)
    public let postalCodeRegex: String?

    /// Массив языков, используемых в стране (ISO 639-1 коды языков)
    public let languages: [String]

    /// Смещение времени относительно UTC в секундах (если для все страны одно смещение)
    public let timezoneOffset: Int?

    /// Словарь идентификаторов в системах, откуда получены данные - [code: id]
    public let externalIds: GeoHelperDictionary<String, String>?

    /// Словарь локализованных имен - [languageIsoCode: localizedName]
    public let localizedNames: GeoHelperDictionary<String, String>

}
