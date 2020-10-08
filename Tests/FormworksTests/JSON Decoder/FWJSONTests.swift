//
//  FWJSONTests.swift
//  
//
//  Created by Rafael Galdino on 07/10/20.
//

import XCTest
@testable import Formworks

final class FWJSONTests: XCTestCase {
    var sut: FWJSON!

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testInvalidData() {
        sut = FWJSON(data: TestFixtures.badFormData)
        sut.decode { (result: Result<FWForm, Error>) in
            switch result {
            case .success:
                XCTFail("InvaldidData: Form successefully decoded.")
            case .failure(let error):
                XCTAssertNotNil(error, "InvaldidData: Form error nil")
            }
        }
        sut = FWJSON(data: TestFixtures.badComponentData)
        sut.decode { (result: Result<FWComponentData, Error>) in
            switch result {
            case .success:
                XCTFail("InvaldidData: Component successefully decoded.")
            case .failure(let error):
                XCTAssertNotNil(error, "InvaldidData: Component error nil")
            }
        }
    }

    func testDecodeForm() {
        sut = FWJSON(data: TestFixtures.formData)
        sut.decode { (result: Result<FWForm, Error>) in
            switch result {
            case .success(let form):
                let errorMessage = "Form does not match it's decoded format"
                XCTAssertEqual(form.title, TestFixtures.form.title, errorMessage)
                XCTAssertEqual(form.components.count, TestFixtures.form.components.count, errorMessage)
            case .failure(let error):
                XCTAssertNil(error, "Error decoding form: \(error.localizedDescription)")
            }
        }
    }

    func testDecodeComponents() {
        sut = FWJSON(data: TestFixtures.plainTextComponentData)
        sut.decode { (result: Result<FWComponentData, Error>) in
            switch result {
            case .success(let component):
                let errorMessage = "Text Component does not match it's decoded format"
                XCTAssertEqual(component.title, TestFixtures.plainTextComponent.title, errorMessage)
                XCTAssertEqual(component.subtitle, TestFixtures.plainTextComponent.subtitle, errorMessage)
                XCTAssertEqual(component.required, TestFixtures.plainTextComponent.required, errorMessage)
                XCTAssertEqual(component.errorMessage, TestFixtures.plainTextComponent.errorMessage, errorMessage)
                XCTAssertNotNil(component.specs, errorMessage)
            case .failure(let error):
                XCTAssertNil(error, "Error decoding single line component: \(error.localizedDescription)")
            }
        }
    }

    static var allTests = [
        ("testInvalidData", testInvalidData),
        ("testDecodeForm", testDecodeForm),
        ("testDecodeComponents", testDecodeComponents)
    ]
}
