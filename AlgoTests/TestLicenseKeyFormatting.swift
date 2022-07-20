//
//  TestLicenseKeyFormatting.swift
//  AlgoTests
//
//  Created by Wei Zhang on 7/14/22.
//

import XCTest
@testable import Algo

class TestLicenseKeyFormatting: XCTestCase {

    func testCase1() {
        let result = LicenseKeyFormatting().licenseKeyFormatting("235F3Z-2e-9-w", 4)
        XCTAssertEqual(result, "23-5F3Z-2E9W")
    }
    
}
