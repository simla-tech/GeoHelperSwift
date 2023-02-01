//
//  Authenticator.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/30/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Alamofire
import Foundation

internal class Authenticator: Alamofire.Authenticator {

    internal typealias Credential = GeoHelperCredential

    internal init() { }

    internal func apply(_ credential: Credential, to urlRequest: inout URLRequest) {
        guard let url = urlRequest.url, var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return
        }
        var queryItems = components.queryItems ?? []
        queryItems.append(URLQueryItem(name: "apiKey", value: credential.apiKey))
        components.queryItems = queryItems
        urlRequest.url = components.url
    }

    internal func refresh(_ credential: Credential, for session: Session, completion: @escaping (Result<Credential, Error>) -> Void) {
        completion(.success(credential))
    }

    internal func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        response.statusCode == 403
    }

    internal func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: Credential) -> Bool {
        guard let url = urlRequest.url, let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems else {
            return false
        }
        return queryItems.contains(where: { $0.name == "apiKey" && $0.value == credential.apiKey })
    }

}

internal struct GeoHelperCredential: Alamofire.AuthenticationCredential {
    let apiKey: String
    let requiresRefresh = false

    init?(apiKey: String?) {
        guard let apiKey else { return nil }
        self.apiKey = apiKey
    }
}
