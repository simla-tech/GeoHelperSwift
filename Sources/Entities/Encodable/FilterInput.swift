//
//  FilterInput.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

internal struct FilterInput<Filter: Encodable>: Encodable {
    internal let filter: Filter?
}
