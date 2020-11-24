//
//  FWFormViewModelTests.swift
//  
//
//  Created by Artur Carneiro on 13/11/20.
//

import XCTest
@testable import Formworks

final class FWFormViewModelTests: XCTestCase {
    var sut: FWFormViewModel!

    func testProperties() {
        let configuration = FWConfiguration(json: TestFixtures.formData, style: .light)
        sut = FWFormViewModel(configuration: configuration)
        sut.setUp()

        XCTAssertEqual(sut.title, TestFixtures.form.title)
        XCTAssertEqual(sut.numberOfComponents, TestFixtures.form.components.count)
        XCTAssertEqual(sut.style, FWStyle.custom(TestFixtures.styleSpec))
    }

    func testViewModelAt() {
        let configuration = FWConfiguration(json: TestFixtures.formData, style: .light)
        sut = FWFormViewModel(configuration: configuration)
        sut.setUp()
        
        let sutViewModelAt = sut.viewModelAt(index: IndexPath(row: 0, section: 0))
        let viewModel = FWTextComponentViewModel(model: TestFixtures.form.components[0] as! FWTextModel)

        XCTAssertEqual(sutViewModelAt.description, viewModel.description)
        XCTAssertEqual(sutViewModelAt.isValid, viewModel.isValid)
        XCTAssertEqual(sutViewModelAt.required, viewModel.required)
        XCTAssertEqual(sutViewModelAt.title, viewModel.title)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
