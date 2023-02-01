//
//  Pagination.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Настройки пагинации
public struct PaginationInput: Encodable {

    /// Страница
    public var page: Int?

    /// Записей на странице (20, 50, 100)
    public var limit: Int?

    /// Инициализация настроек пгинации
    /// - Parameters:
    ///   - page: Страница
    ///   - limit: Записей на странице (20, 50, 100)
    public init(page: Int? = nil, limit: Int? = nil) {
        self.page = page
        self.limit = limit
    }

}
