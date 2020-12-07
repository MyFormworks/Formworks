//
//  FWRegexValidatorTests.swift
//  FormworksTests
//
//  Created by Edgar Sgroi on 29/10/20.
//

import XCTest
import Quick
import Nimble
@testable import Formworks

final class FWRegexValidatorSpec: QuickSpec {
    override func spec() {
        var sut: FWRegexValidator!
        describe("when the regex is") {
            context("valid") {
                it("for email") {
                    let regex = FWRegex.email.rawValue
                    sut = FWRegexValidator(regex: regex)
                    
                    var result = sut.validate("test@example.com")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("test01@example.com")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("test@example01.com")
                    expect(result).to(beTrue())
                }
                
                it ("for phonenumber") {
                    let regex = FWRegex.phonenumber.rawValue
                    sut = FWRegexValidator(regex: regex)
                    
                    var result = sut.validate("0012345678")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("00123456789")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("00 1234 1234")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("00 12345 1234")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("(00)1234-1234")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("(00)12345-1234")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("(00)12345678")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("(00)123456789")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("(00) 1234 1234")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("(00) 12345 1234")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("(00) 12345678")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("(00) 123456789")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("(000)1234 1234")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("(000)12345 1234")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("0000123456789")
                    expect(result).to(beTrue())
                }
                
                it("for max32") {
                    let regex = FWRegex.max32.rawValue
                    sut = FWRegexValidator(regex: regex)
                    
                    var result = sut.validate("This is a test text")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("This is a 32 characters text! =)")
                    expect(result).to(beTrue())
                }
                
                it("for custom") {
                    let regex = "[a-z]at"
                    sut = FWRegexValidator(regex: regex)
                    
                    var result = sut.validate("hat")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("rat")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("cat")
                    expect(result).to(beTrue())
                    
                    result = sut.validate("bat")
                    expect(result).to(beTrue())
                }
            }
            
            context("invalid") {
                it("for email") {
                    let regex = FWRegex.email.rawValue
                    sut = FWRegexValidator(regex: regex)
                    
                    var result = sut.validate("this is not an email")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("test@example")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("testexample.com")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("test@@example.com")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("#test@example.com")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("test@#example.com")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("")
                    expect(result).to(beFalse())
                }
                
                it("for phonenumber") {
                    let regex = FWRegex.phonenumber.rawValue
                    sut = FWRegexValidator(regex: regex)
                    
                    var result = sut.validate("This is not a phonenumber")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("12345678")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("123456789")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("11 1234@5678")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("(0000)000000000")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("123")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("")
                    expect(result).to(beFalse())
                }
                
                it("for max32") {
                    let regex = FWRegex.max32.rawValue
                    sut = FWRegexValidator(regex: regex)
                    
                    var result = sut.validate("This is a text with 33 characters")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("This text have more than 32 characters. To be more exact, this text is 90 characters long.")
                    expect(result).to(beFalse())
                }
                
                it("for custom") {
                    let regex = "[a-z]at"
                    sut = FWRegexValidator(regex: regex)
                    
                    var result = sut.validate("1at")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("@at")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("chat")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("battery")
                    expect(result).to(beFalse())
                    
                    result = sut.validate("banana")
                    expect(result).to(beFalse())
                }
            }
        }
    }
    
    static var allTests = [
        ("tests", spec)
    ]
}
