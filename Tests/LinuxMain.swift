import XCTest

import FormworksTests

var tests = [XCTestCaseEntry]()
tests += ManualLayoutTests.allTests()
tests += FWJSONTests.allTests()
tests += FWSingleLineViewModelTests.allTests()
tests += FWRegexValidatorTests.allTests()
XCTMain(tests)
