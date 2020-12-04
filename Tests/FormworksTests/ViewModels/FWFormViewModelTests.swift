//
//  FWFormViewModelTests.swift
//  
//
//  Created by Artur Carneiro on 13/11/20.
//

import XCTest
import Quick
import Nimble
@testable import Formworks

final class FWFormViewModelSpec: QuickSpec {
    override func spec() {
        var sut: FWFormViewModel!
        
        describe("the properties") {
            it ("are correct") {
                let configuration = FWConfiguration(json: TestFixtures.formData, style: .custom(FWStyleSpecification()))
                sut = FWFormViewModel(configuration: configuration)
                sut.setUp()

                expect(sut.title).to(equal(TestFixtures.form.title))
                expect(sut.numberOfComponents).to(equal(TestFixtures.form.components.count))
                expect(sut.style).to(equal(FWStyle.custom(TestFixtures.styleSpec)))
            }
        }
        
        describe("the view model") {
            it("is at index path") {
                let configuration = FWConfiguration(json: TestFixtures.formData, style: .light)
                sut = FWFormViewModel(configuration: configuration)
                sut.setUp()
                
                let sutViewModelAt = sut.viewModelAt(index: IndexPath(row: 0, section: 0))
                let viewModel = FWTextComponentViewModel(model: TestFixtures.form.components[0] as! FWTextModel)

                expect(sutViewModelAt.description).to(equal(viewModel.description))
                expect(sutViewModelAt.isValid).to(equal(viewModel.isValid))
                expect(sutViewModelAt.required).to(equal(viewModel.required))
                expect(sutViewModelAt.title).to(equal(viewModel.title))
            }
        }
    }
    
    static var allTests = [
        ("tests", spec)
    ]
}
