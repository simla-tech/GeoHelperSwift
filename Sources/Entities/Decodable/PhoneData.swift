//
//  PhoneData.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Данные о телефоне и часовом поясе
public struct PhoneData: Decodable {

    /// Источник данных
    public let dataSource: String

    /// ABC/DEF код
    public let abcDefCode: Int

    /// Начало диапазона
    public let rangeStart: Int

    /// Конец диапазона
    public let rangeEnd: Int

    /// Имя оператора
    public let providerName: String

    /// Регион
    public let region: Region

    /// Страна
    public let country: Country?

    /// Телефон, разбитый на части
    public let phoneParts: PhoneParts

}
