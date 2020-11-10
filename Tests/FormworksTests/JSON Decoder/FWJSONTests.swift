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

    func testEmptyData() {
        sut = FWJSON(data: TestFixtures.emptyFormData)
        sut.decode { (result: Result<FWFormModel, Error>) in
            switch result {
            case .success:
                XCTFail("InvaldidData: Form successefully decoded.")
            case .failure(let error):
                XCTAssertNotNil(error, "InvaldidData: Form error nil")
            }
        }
    }
    
    func testBadComponentData() {
        sut = FWJSON(data: TestFixtures.badComponentData)
        sut.decode { (result: Result<FWComponentModel, Error>) in
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
        sut.decode { (result: Result<FWFormModel, Error>) in
            switch result {
            case .success(let form):
                let errorMessage = "Form does not match it's decoded format"
                XCTAssertEqual(form.title, TestFixtures.form.title, errorMessage)
                XCTAssertEqual(form.components.count, TestFixtures.form.components.count, errorMessage)
                XCTAssertEqual(form.id, TestFixtures.form.id, errorMessage)
                XCTAssertEqual(form.responseFormat, TestFixtures.form.responseFormat, errorMessage)
                XCTAssertEqual(form.style, TestFixtures.form.style, errorMessage)
            case .failure(let error):
                XCTAssertNil(error, "Error decoding form: \(error.localizedDescription)")
            }
        }
    }

    func testDecodeComponents() {
        sut = FWJSON(data: TestFixtures.textComponentData)
        sut.decode { (result: Result<FWComponentModel, Error>) in
            switch result {
            case .success(let component):
                let errorMessage = "Text Component does not match it's decoded format"
                XCTAssertEqual(component.title, TestFixtures.textComponent.title, errorMessage)
                XCTAssertEqual(component.description, TestFixtures.textComponent.description, errorMessage)
                XCTAssertEqual(component.required, TestFixtures.textComponent.required, errorMessage)
            case .failure(let error):
                XCTAssertNil(error, "Error decoding single line component: \(error.localizedDescription)")
            }
        }
    }

    static var allTests = [
        ("testEmptyData", testEmptyData),
        ("testBadComponentData", testBadComponentData),
        ("testDecodeForm", testDecodeForm),
        ("testDecodeComponents", testDecodeComponents)
    ]
}
