//
//  Utilities.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Alamofire
import Foundation

internal func mapResponse<T: Decodable>(response: DataResponse<T, AFError>) -> Result<T, Error> {
    switch response.result {
    case .success(let value):
        return .success(value)
    case .failure(let error):
        return .failure(mapError(error))
    }
}

internal func mapError(_ afError: AFError) -> Error {
    afError.underlyingError ?? afError
}

internal func validateError(request: URLRequest?, response: URLResponse?, data: Data?) -> Request.ValidationResult {
    if let data, let failedResponse = try? JSONDecoder().decode(FailedResponse.self, from: data), !failedResponse.success {
        return .failure(failedResponse.error)
    }
    return .success(())
}
