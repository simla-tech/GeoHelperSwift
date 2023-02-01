//
//  Response.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Успешный ответ сервера с пагинацией
public struct PaginatedResponse<T: Decodable>: Decodable {

    /// Флаг успешного запроса
    public let success: Bool

    /// Язык ответа
    public let language: String

    /// Результат запроса
    public let result: [T]

    /// Данные пагинации
    public let pagination: Pagination
}
