//
//  Utilities.swift
//  GeoHelper
//
//  Created by Ilya Kharlamov on 1/31/23.
//  Copyright © 2023 DIGITAL RETAIL TECHNOLOGIES, S.L. All rights reserved.
//

import XCTest
@testable import GeoHelper

func XCTAssertPaginatedResponse<T>(
    _ value: PaginatedResponse<T>,
    locale: LocaleConfiguration,
    file: StaticString = #filePath,
    line: UInt = #line
) {
    XCTAssertTrue(value.success)
    XCTAssertEqual(value.language, locale.lang)
    XCTAssertTrue(value.success, "Success is not true", file: file, line: line)
}

func XCTAssertPaginatedResult<T>(
    _ result: Result<PaginatedResponse<T>, Error>,
    locale: LocaleConfiguration,
    file: StaticString = #filePath,
    line: UInt = #line
) {
    do {
        XCTAssertPaginatedResponse(try result.get(), locale: locale, file: file, line: line)
    } catch let error as GeoHelperError {
        if let detail = error.details.first {
            XCTFail(detail, file: file, line: line)
        } else {
            XCTFail(error.message, file: file, line: line)
        }
    } catch {
        XCTFail(error.localizedDescription, file: file, line: line)
    }
}
