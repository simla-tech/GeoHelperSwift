//
//  Region.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Регион
public struct Region: Decodable, Identifiable {

    /// Автоинкрементальный идентификатор
    public let id: Int

    /// Имя региона
    public let name: String

    /// ISO код (ISO 3166-1 alpha-2)
    public let countryIso: String

    /// Словарь кодов региона - [codeName: code]
    public let codes: GeoHelperDictionary<String, String>

    /// Тип объекта
    public let localityType: LocalityType?

    /// Часовой пояс региона (Пример: "Europe/London")
    public let timezone: String?

    /// Смещение времени относительно UTC в секундах
    public let timezoneOffset: Int?

    /// Страна
    public let countryId: Country.ID

    /// Словарь идентификаторов в системах, откуда получены данные - [code: id]
    public let externalIds: GeoHelperDictionary<String, String>

    /// Словарь локализованных имен - [languageIsoCode: localizedName]
    public let localizedNames: GeoHelperDictionary<String, String>

}
