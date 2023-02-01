//
//  City.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Город
public struct City: Decodable, Identifiable {

    /// Автоинкрементальный идентификатор
    public let id: Int

    /// Имя города
    public let name: String

    /// Тип объекта
    public let localityType: LocalityType

    /// Идентификатор населенного пункта, в состав которого входит данный населенный пункт
    public let parentCityId: City.ID?

    /// Район
    public let area: String?

    /// Словарь кодов региона - [codeName: code]
    public let codes: GeoHelperDictionary<String, String>?

    /// Почтовый индекс
    public let postCode: String?

    /// Население
    public let population: Int?

    /// Регион
    public let regionId: Region.ID

    /// Словарь идентификаторов в системах, откуда получены данные - [code: id]
    public let externalIds: GeoHelperDictionary<String, String>

    /// Словарь локализованных имен - [languageIsoCode: localizedName]
    public let localizedNames: GeoHelperDictionary<String, String>

}
