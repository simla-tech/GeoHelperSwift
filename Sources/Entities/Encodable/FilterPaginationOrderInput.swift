//
//  CountriesInput.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

internal struct FilterPaginationOrderInput<Filter: Encodable>: Encodable {
    internal let filter: Filter?
    internal let pagination: PaginationInput?
    internal let order: OrderInput?
}
