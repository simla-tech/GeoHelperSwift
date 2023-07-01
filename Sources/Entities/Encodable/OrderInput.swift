//
//  OrderInput.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Настройки пагинации
public struct OrderInput: Encodable {

    /// Имя поля по которому производится сортировка
    public var by: String?

    /// Направление сортировки
    public var dir: OrderDir?

    public init(by: String? = nil, dir: OrderDir? = nil) {
        self.by = by
        self.dir = dir
    }

}
