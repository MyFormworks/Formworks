//
//  FWJSONTests.swift
//  
//
//  Created by Rafael Galdino on 07/10/20.
//

import XCTest
import Quick
import Nimble
@testable import Formworks

final class FWJSONSpec: QuickSpec {
    override func spec() {
        var sut: FWJSON!
        
        describe("when the data") {
            it("is empty") {
                sut = FWJSON(data: TestFixtures.emptyFormData)
                sut.decode { (result: Result<FWFormModel, Error>) in
                    switch result {
                    case .success:
                        fail("InvaldidData: Form successefully decoded.")
                    case .failure(let error):
                        expect(error).notTo(beNil())
                    }
                }
            }
            
            it("has bad component") {
                sut = FWJSON(data: TestFixtures.badComponentData)
                sut.decode { (result: Result<FWComponentModel, Error>) in
                    switch result {
                    case .success:
                        fail("InvaldidData: Component successefully decoded.")
                    case .failure(let error):
                        expect(error).notTo(beNil())
                    }
                }
            }
            
            it("can be decoded into a form") {
                sut = FWJSON(data: TestFixtures.formData)
                sut.decode { (result: Result<FWFormModel, Error>) in
                    switch result {
                    case .success(let form):
                        expect(form.title).to(equal(TestFixtures.form.title))
                        expect(form.components.count).to(equal(TestFixtures.form.components.count))
                        expect(form.id).to(equal(TestFixtures.form.id))
                        expect(form.responseFormat).to(equal(TestFixtures.form.responseFormat))
                        expect(form.style).to(equal(TestFixtures.form.style))
                    case .failure(let error):
//                        expect(error).to(beNil(), description: "Error decoding form: \(error.localizedDescription)")
                        fail("Error decoding form: \(error.localizedDescription)")
                    }
                }
            }
            
            it("can be decoded into components") {
                sut = FWJSON(data: TestFixtures.textComponentData)
                sut.decode { (result: Result<FWComponentModel, Error>) in
                    switch result {
                    case .success(let component):
                        expect(component.title).to(equal(TestFixtures.textComponent.title))
                        expect(component.description).to(equal(TestFixtures.textComponent.description))
                        expect(component.required).to(equal(TestFixtures.textComponent.required))
                    case .failure(let error):
//                        expect(error).to(beNil(), description: "Error decoding single line component: \(error.localizedDescription)")
                        fail("Error decoding single line component: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    static var allTests = [
        ("tests", spec)
    ]
}
