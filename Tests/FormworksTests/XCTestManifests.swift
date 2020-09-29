import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(FormworksTests.allTests),
        testCase(ManualLayoutTests.allTests),
    ]
}
#endif
