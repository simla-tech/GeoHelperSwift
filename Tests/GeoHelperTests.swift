//
//  ClientTests.swift
//  GrapheneTests
//
//  Created by Ilya Kharlamov on 03.08.2021.
//  Copyright © 2021 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//
//  swiftlint:disable no_hiding_in_strings

import XCTest
@testable import GeoHelper

class GeoHelperTests: XCTestCase {

    private let paginatedLimit = PaginationInput(page: 0, limit: 100)
    private let apiKey = "6GWQCRqmn4SFi35YO8leYe2K1DLLDKe9"
    private let localeConfiguration = LocaleConfiguration(lang: "ru", fallbackLang: nil)
    private lazy var geohelper = GeoHelper(apiKey: self.apiKey, localeConfiguration: self.localeConfiguration)

    func testInit() {
        XCTAssertEqual(self.geohelper.apiKey, self.apiKey)
        XCTAssertEqual(self.geohelper.localeConfiguration?.lang, self.localeConfiguration.lang)
        XCTAssertEqual(self.geohelper.localeConfiguration?.fallbackLang, self.localeConfiguration.fallbackLang)
    }

    func testCountries() async throws {
        let response = try await self.geohelper.countries(
            pagination: self.paginatedLimit,
            order: OrderInput(by: "name", dir: .asc)
        )
        XCTAssertPaginatedResponse(response, locale: self.localeConfiguration)
    }

    func testRegions() async throws {
        let response = try await self.geohelper.regions(
            filter: .with({ $0.countryIso = "RU" }),
            pagination: self.paginatedLimit,
            order: OrderInput(by: "name", dir: .asc)
        )
        XCTAssertEqual(response.language, self.localeConfiguration.lang)
        XCTAssertEqual(response.result.first?.countryIso, "RU")
    }

    func testCities() async throws {
        let response = try await self.geohelper.cities(
            filter: .with({ $0.countryIso = "RU" }),
            pagination: self.paginatedLimit,
            order: OrderInput(by: "name", dir: .asc)
        )
        XCTAssertPaginatedResponse(response, locale: self.localeConfiguration)
    }

    func testDistricts() async throws {
        let response = try await self.geohelper.districts(
            pagination: self.paginatedLimit,
            order: OrderInput(by: "name", dir: .asc)
        )
        XCTAssertPaginatedResponse(response, locale: self.localeConfiguration)
    }

    func testStreets() async throws {
        let response = try await self.geohelper.streets(
            filter: .with({ $0.cityId = 1 }),
            pagination: self.paginatedLimit,
            order: OrderInput(by: "name", dir: .asc)
        )
        XCTAssertPaginatedResponse(response, locale: self.localeConfiguration)
    }

    func testPostCode() async throws {
        let response = try await self.geohelper.postCode(
            filter: .with({
                $0.cityId = 4995 // Moscow
                $0.streetId = 1_778_712 // Akademika Volgina
                $0.houseNumber = "19"
            })
        )
        XCTAssertEqual(response.result, "117485")
    }

    func testServiceLocality() async throws {
        let response = try await self.geohelper.serviceLocality(
            filter: .with({
                $0.service = "yandex"
                $0.type = .city
            }),
            pagination: self.paginatedLimit,
            order: OrderInput(by: "name", dir: .asc)
        )
        XCTAssertPaginatedResponse(response, locale: self.localeConfiguration)
    }

    func testPhoneData() async throws {
        let response = try await self.geohelper.phoneData(phone: "+79250494763")
        XCTAssertEqual(response.result.providerName, "ПАО \"МегаФон\"")
        XCTAssertEqual(response.result.phoneParts.countryCode, 7)
        XCTAssertEqual(response.result.phoneParts.code, "925")
        XCTAssertEqual(response.result.phoneParts.number, "0494763")
    }

}
