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

        describe("the view") {
            context("has") {
                it("translatesAutoresizingMaskIntoConstraints setted as false") {
                    expect(self.sut.translatesAutoresizingMaskIntoConstraints).to(beFalse())
                }
                
                it("frame setted as zero") {
                    expect(self.sut.frame).to(equal(CGRect(x: 0, y: 0, width: 0, height: 0)))
                }
            }
        }
    }
    
    static var allTests = [
        ("tests", spec)
    ]
}
