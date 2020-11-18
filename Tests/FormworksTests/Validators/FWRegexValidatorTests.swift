//
//  FWRegexValidatorTests.swift
//  FormworksTests
//
//  Created by Edgar Sgroi on 29/10/20.
//

import XCTest
@testable import Formworks

class FWRegexValidatorTests: XCTestCase {
    var sut: FWRegexValidator!

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    // MARK: Email
    func testEmailValidationSuccess() {
        let regex = FWRegex.email.rawValue
        sut = FWRegexValidator(regex: regex)
        
        var result = sut.validate("test@example.com")
        XCTAssertTrue(result)
        
        result = sut.validate("test01@example.com")
        XCTAssertTrue(result)
        
        result = sut.validate("test@example01.com")
        XCTAssertTrue(result)
    }
    
    func testEmailValidationFail() {
        let regex = FWRegex.email.rawValue
        sut = FWRegexValidator(regex: regex)
        
        var result = sut.validate("this is not an email")
        XCTAssertFalse(result)
        
        result = sut.validate("test@example")
        XCTAssertFalse(result)
        
        result = sut.validate("testexample.com")
        XCTAssertFalse(result)
        
        result = sut.validate("test@@example.com")
        XCTAssertFalse(result)
        
        result = sut.validate("#test@example.com")
        XCTAssertFalse(result)
        
        result = sut.validate("test@#example.com")
        XCTAssertFalse(result)
        
        result = sut.validate("")
        XCTAssertFalse(result)
    }
    
    // MARK: Phonenumber
    func testPhonenumberValidationSuccess() {
        let regex = FWRegex.phonenumber.rawValue
        sut = FWRegexValidator(regex: regex)
        
        var result = sut.validate("00 1234 1234")
        XCTAssertTrue(result)
        
        result = sut.validate("00 12345 1234")
        XCTAssertTrue(result)
        
        result = sut.validate("(00)1234-1234")
        XCTAssertTrue(result)
        
        result = sut.validate("(00)12345-1234")
        XCTAssertTrue(result)
        
        result = sut.validate("(00)12345678")
        XCTAssertTrue(result)
        
        result = sut.validate("(00)123456789")
        XCTAssertTrue(result)
        
        result = sut.validate("(00) 1234 1234")
        XCTAssertTrue(result)
        
        result = sut.validate("(00) 12345 1234")
        XCTAssertTrue(result)
        
        result = sut.validate("(00) 12345678")
        XCTAssertTrue(result)
        
        result = sut.validate("(00) 123456789")
        XCTAssertTrue(result)
        
        result = sut.validate("(000)1234 1234")
        XCTAssertTrue(result)
        
        result = sut.validate("(000)12345 1234")
        XCTAssertTrue(result)
    }
    
    func testPhonenumberValidationFail() {
        let regex = FWRegex.phonenumber.rawValue
        sut = FWRegexValidator(regex: regex)
        
        var result = sut.validate("This is not a phonenumber")
        XCTAssertFalse(result)
        
        result = sut.validate("0012345678")
        XCTAssertTrue(result)
        
        result = sut.validate("00123456789")
        XCTAssertTrue(result)
        
        result = sut.validate("12345678")
        XCTAssertFalse(result)
        
        result = sut.validate("123456789")
        XCTAssertFalse(result)
        
        result = sut.validate("11 1234@5678")
        XCTAssertFalse(result)
        
        result = sut.validate("(0000)000000000")
        XCTAssertFalse(result)
        
        result = sut.validate("0000000000000")
        XCTAssertTrue(result)
        
        result = sut.validate("123")
        XCTAssertFalse(result)
        
        result = sut.validate("")
        XCTAssertFalse(result)
    }
    
    // MARK: Max32
    func testMax32ValidationSuccess() {
        let regex = FWRegex.max32.rawValue
        sut = FWRegexValidator(regex: regex)
        
        var result = sut.validate("This is a test text")
        XCTAssertTrue(result)
        
        result = sut.validate("This is a 32 characters text! =)")
        XCTAssertTrue(result)
    }
    
    func testMax32ValidationFail() {
        let regex = FWRegex.max32.rawValue
        sut = FWRegexValidator(regex: regex)
        
        var result = sut.validate("This is a text with 33 characters")
        XCTAssertFalse(result)
        
        result = sut.validate("This text have more than 32 characters. To be more exact, this text is 90 characters long.")
        XCTAssertFalse(result)
    }
    
    // MARK: Custom
    func testCustomValidationSuccess() {
        let regex = "[a-z]at"
        sut = FWRegexValidator(regex: regex)
        
        var result = sut.validate("hat")
        XCTAssertTrue(result)
        
        result = sut.validate("rat")
        XCTAssertTrue(result)
        
        result = sut.validate("cat")
        XCTAssertTrue(result)
        
        result = sut.validate("bat")
        XCTAssertTrue(result)
    }
    
    func testCustomValidationFail() {
        let regex = "[a-z]at"
        sut = FWRegexValidator(regex: regex)
        
        var result = sut.validate("1at")
        XCTAssertFalse(result)
        
        result = sut.validate("@at")
        XCTAssertFalse(result)
        
        result = sut.validate("chat")
        XCTAssertFalse(result)
        
        result = sut.validate("battery")
        XCTAssertFalse(result)
        
        result = sut.validate("banana")
        XCTAssertFalse(result)
    }
    
    static var allTests = [
        ("testEmailValidationSuccess", testEmailValidationSuccess),
        ("testEmailValidationFail", testEmailValidationFail),
        
        ("testPhonenumberValidationSuccess", testPhonenumberValidationSuccess),
        ("testPhonenumberValidationFail", testPhonenumberValidationFail),
        
        ("testMax32ValidationSuccess", testMax32ValidationSuccess),
        ("testMax32ValidationFail", testMax32ValidationFail),
        
        ("testCustomValidationSuccess", testCustomValidationSuccess),
        ("testCustomValidationFail", testCustomValidationFail)
    ]

}
