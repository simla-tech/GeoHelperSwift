//
//  ServiceLocalityFilter.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Фильтр для поиска гео-объекта по данным стороннего сервиса
public struct ServiceLocalityFilter: Encodable, GeoHelperFilter {

    /// Тип объекта (страна, регион или город)
    public var type: ServiceLocalityType?

    /// Код сервиса. Обязательное поле
    ///
    /// Пример: **sdek** / **dpd** / **yandex**
    public var service: String?

    /// Идентификатор в стороннем сервисе
    public var externalId: String?

    /// Внутренний идентификатор гео-объекта в geohelper
    public var innerId: String?

    /// ISO код страны (ISO 3166-1 alpha-2)
    public var countryIso: String?

    /// Наименование объекта
    public var name: String?

    /// Поиск по точному совпадению имени
    public var strictName: String?

    /// Поиск по дополнительным данным гео-объекта из сервиса (пример - у объектов СДЭК есть свойство codLimit)
    public var customData: [String: String]?

    public init() { }

}
