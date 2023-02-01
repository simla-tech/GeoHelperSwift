//
//  LocaleRequestAdapter.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Alamofire
import Foundation

internal class LocaleRequestAdapter: RequestInterceptor {

    internal var configuration: LocaleConfiguration?

    internal init(configuration: LocaleConfiguration?) {
        self.configuration = configuration
    }

    internal func adapt(
        _ urlRequest: URLRequest,
        for session: Alamofire.Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void
    ) {
        guard let url = urlRequest.url, var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return
        }
        var queryItems = components.queryItems ?? []
        if let configuration {
            queryItems.append(URLQueryItem(name: "locale[lang]", value: configuration.lang))
            if let fallbackLang = configuration.fallbackLang {
                queryItems.append(URLQueryItem(name: "locale[fallbackLang]", value: fallbackLang))
            }
        }
        components.queryItems = queryItems
        do {
            var mutableRequest = urlRequest
            mutableRequest.url = try components.asURL()
            completion(.success(mutableRequest))
        } catch {
            completion(.failure(error))
        }
    }

}
