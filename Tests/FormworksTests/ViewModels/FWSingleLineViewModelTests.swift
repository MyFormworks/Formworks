//
//  FWSingleLineViewModelTests.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 07/10/20.
//

import Foundation
@testable import Formworks
import XCTest

final class FWSingleLineViewModelTests: XCTestCase {
	
	var sut: FWSingleLineViewModel!
	
	override func setUp() {
		super.setUp()
		sut = FWSingleLineViewModel()
	}
	
	func testContentIsValid() {
		sut.content = "Mackenzie"
		XCTAssertTrue(sut.isValid)
	}
	
	override func tearDown() {
		sut = nil
		super.tearDown()
	}
	
}
