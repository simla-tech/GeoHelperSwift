//
//  District.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Район
public struct District: Decodable, Identifiable {

    /// Автоинкрементальный идентификатор
    public let id: Int

    /// Имя города
    public let name: String

    /// Словарь кодов районов - [codeName: code]
    public let codes: GeoHelperDictionary<String, String>?

    /// Идентификатор города
    public let cityId: City.ID

    /// Тип объекта
    public let localityType: LocalityType?

    /// Словарь идентификаторов в системах, откуда получены данные - [code: id]
    public let externalIds: GeoHelperDictionary<String, String>

    /// Словарь локализованных имен - [languageIsoCode: localizedName]
    public let localizedNames: GeoHelperDictionary<String, String>

}
