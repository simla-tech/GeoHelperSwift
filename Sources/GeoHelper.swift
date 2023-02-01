//
//  GeoHelper.swift
//  Simla Mobile
//
//  Created by Ilya Kharlamov on 05.10.2020.
//  Copyright © 2020 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import Alamofire
import Foundation

/// GeoHelper клиент
public class GeoHelper {

    internal let session: Alamofire.Session
    internal let authenticationInterceptor: AuthenticationInterceptor<Authenticator>
    internal let localeRequestAdapter: LocaleRequestAdapter

    /// API ключ. Можно получить на [geohelper.info](http://geohelper.info)
    public var apiKey: String? {
        get { self.authenticationInterceptor.credential?.apiKey }
        set { self.authenticationInterceptor.credential = GeoHelperCredential(apiKey: newValue) }
    }

    /// Настройки локализации ответного сообщения
    public var localeConfiguration: LocaleConfiguration? {
        get { self.localeRequestAdapter.configuration }
        set { self.localeRequestAdapter.configuration = newValue }
    }

    /// Инициализация GeoHelper клиента
    /// - Parameters:
    ///   - apiKey: API ключ. Можно получить на [geohelper.info](http://geohelper.info)
    ///   - localeConfiguration: Настройки локализации ответного сообщения
    ///   - eventMonitors: Слушатели жизненого цикла запросов
    public init(
        apiKey: String,
        localeConfiguration: LocaleConfiguration? = LocaleConfiguration(),
        eventMonitors: [EventMonitor] = []
    ) {
        let rootQueue = DispatchQueue(label: "com.simla.GeoHelper.rootQueue")
        let authenticationInterceptor = AuthenticationInterceptor(
            authenticator: Authenticator(),
            credential: GeoHelperCredential(apiKey: apiKey)
        )
        let localeRequestAdapter = LocaleRequestAdapter(configuration: localeConfiguration)
        self.localeRequestAdapter = localeRequestAdapter
        self.authenticationInterceptor = authenticationInterceptor
        self.session = Session(
            rootQueue: rootQueue,
            interceptor: Interceptor(
                adapters: [localeRequestAdapter],
                interceptors: [authenticationInterceptor]
            ),
            eventMonitors: eventMonitors
        )
    }

}
