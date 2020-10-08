import XCTest

import FormworksTests

var tests = [XCTestCaseEntry]()
tests += ManualLayoutTests.allTests()
tests += FWJSONTests.allTests()
XCTMain(tests)
