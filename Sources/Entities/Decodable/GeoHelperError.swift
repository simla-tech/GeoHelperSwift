//
//  GeoHelperError.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Foundation

/// Информация об ошибках при выполнении запроса
public struct GeoHelperError {

    /// Текст ошибки
    public let message: String

    /// Код ошибки
    public let code: Int

    /// Доплительная информация об ошибке
    public let details: [String]
}

extension GeoHelperError: Decodable {

    private enum CodingKeys: String, CodingKey {
        case message
        case code
        case details
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
        self.code = try container.decode(Int.self, forKey: .code)
        self.details = try container.decodeIfPresent([String].self, forKey: .details) ?? []
    }

}

extension GeoHelperError: LocalizedError {
    public var errorDescription: String? {
        self.message
    }
}

extension GeoHelperError: CustomNSError {

    public static var errorDomain: String {
        "com.simla.GeoHelper.Error"
    }

    public var errorCode: Int {
        self.code
    }

    public var errorUserInfo: [String: Any] {
        ["details": self.details]
    }

}
