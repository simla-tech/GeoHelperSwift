//
//  Street.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Улица
public struct Street: Decodable, Identifiable {

    /// Идентификатор
    public let id: Int

    /// Имя улицы
    public let name: String

    /// Почтовый индекс
    public let postCode: String?

    /// Словарь кодов улиц - [codeName: code]
    public let codes: GeoHelperDictionary<String, String>?

    /// Идентификатор города
    public let cityId: City.ID

    /// Район города
    public let districtId: District.ID?

    /// Родительская улица
    public let parentStreetId: Street.ID?

    /// Тип объекта
    public let localityType: LocalityType?

    /// Словарь идентификаторов в системах, откуда получены данные - [code: id]
    public let externalIds: GeoHelperDictionary<String, String>?

    /// Словарь локализованных имен - [languageIsoCode: localizedName]
    public let localizedNames: GeoHelperDictionary<String, String>

}
