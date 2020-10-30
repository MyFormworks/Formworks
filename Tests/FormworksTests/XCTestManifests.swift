import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ManualLayoutTests.allTests),
        testCase(FWJSONTests.allTests),
        testCase(FWSingleLineViewModelTests.allTests),
        testCase(FWRegexValidatorTests.allTests)
    ]
}
#endif
