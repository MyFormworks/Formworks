import XCTest

import FormworksTests

var tests = [XCTestCaseEntry]()
tests += FormworksTests.allTests()
tests += AutoLayoutTests.allTests()
XCTMain(tests)
