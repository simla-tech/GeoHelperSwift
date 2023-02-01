//
//  PageInfo.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Данные пагинации
public struct Pagination: Decodable {

    /// Количество элементов в текущем ответе
    public let limit: Int

    /// Общее количество элементов
    public let totalCount: Int

    /// Текущая страница
    public let currentPage: Int

    /// Общее количество страниц с ответом
    public let totalPageCount: Int

}
