//
//  PostCode.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Успешный ответ сервера
public struct GeoHelperResponse<Result: Decodable>: Decodable {

    /// Флаг успешного запроса
    public let success: Bool

    /// Язык ответа
    public let language: String

    /// Результат запроса
    public let result: Result

}
