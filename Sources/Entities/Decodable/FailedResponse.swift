//
//  FailedResponse.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

internal struct FailedResponse: Decodable {
    internal let success: Bool
    internal let error: GeoHelperError
}
