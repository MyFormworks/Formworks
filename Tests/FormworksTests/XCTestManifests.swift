import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ManualLayoutTests.allTests),
        testCase(FWSingleLineViewModelTests.allTests)
    ]
}
#endif
