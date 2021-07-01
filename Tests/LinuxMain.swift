import XCTest

import FormworksTests

var tests = [XCTestCaseEntry]()
tests += ManualLayoutTests.allTests()
tests += FWJSONTests.allTests()
tests += FWFormViewModelTests.allTests()
tests += FWRegexValidatorTests.allTests()
XCTMain(tests)
