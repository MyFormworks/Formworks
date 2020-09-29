import XCTest

import FormworksTests

var tests = [XCTestCaseEntry]()
tests += FormworksTests.allTests()
tests += ManualLayoutTests.allTests()
XCTMain(tests)
