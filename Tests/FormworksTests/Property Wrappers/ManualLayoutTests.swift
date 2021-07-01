//
//  ManualLayoutTests.swift
//  
//
//  Created by Artur Carneiro on 28/09/20.
//

import XCTest
import UIKit
import Quick
import Nimble
@testable import Formworks

final class ManualLayoutSpec: QuickSpec {
    @ManualLayout var sut: UIView
    override func spec() {

        describe("when the view") {
            describe("property") {
                it("translatesAutoresizingMaskIntoConstraints is set to false") {
                    expect(self.sut.translatesAutoresizingMaskIntoConstraints).to(beFalse())
                }
                
                it("frame is set to zero") {
                    expect(self.sut.frame).to(equal(CGRect.zero))
                }
            }
        }
    }
    
    static var allTests = [
        ("tests", spec)
    ]
}
