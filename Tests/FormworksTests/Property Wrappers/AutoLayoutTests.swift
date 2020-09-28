//
//  File.swift
//  
//
//  Created by Artur Carneiro on 28/09/20.
//

import XCTest
import UIKit
@testable import Formworks

final class AutoLayoutTests: XCTestCase {
    @AutoLayout var sut: UIView

    func testTranslatesAutoresizingMaskIntoConstraints() {
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints)
    }

    func testFrameZero() {
        XCTAssertEqual(sut.frame, CGRect(x: 0, y: 0, width: 0, height: 0))
    }

    static var allTests = [
        ("testTranslatesAutoresizingMaskIntoConstraints", testTranslatesAutoresizingMaskIntoConstraints),
        ("testFrameZero", testFrameZero)
    ]
}
