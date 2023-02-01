//
//  OrderDir.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Направление сортировки
public enum OrderDir: String, Encodable {
    
    /// По возрастанию
    case asc
    
    /// По убыванию
    case desc
}
