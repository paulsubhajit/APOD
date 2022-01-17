//
//  APODSearchRemoteDataStoreTest.swift
//  APODApplicationTests
//


import XCTest
@testable import APODApp

class APODSearchRemoteDataStoreTest: XCTestCase {
    func test_GetAPODSearchRemotesSuccess() {
        let apiHandler = APODAPIHandlerMock(fetchAPODSearchAPIResult: .successWithValue)
        let remoteDataStore = APODSearchRemoteStore(apiHandler: apiHandler)
        let parameter = APODSearchParamater(date: "FBI")
        let expectSuccess = XCTestExpectation(description: "Expectation-Success")
        remoteDataStore.getAPODList(paramater: parameter) { (result) in
            switch result {
            case .success:
                expectSuccess.fulfill()
            case .failure(let failure):
                XCTFail("Should not receive failure - \(failure)")
            }
        }
        wait(for: [expectSuccess], timeout: 1.0)
    }
    
    func test_GetAPODSearchRemotesFailure() {
        let apiHandler = APODAPIHandlerMock(fetchAPODSearchAPIResult: .failureWithError)
        let remoteDataStore = APODSearchRemoteStore(apiHandler: apiHandler)
        let parameter = APODSearchParamater(date: "FBI")
        let expectFailure = XCTestExpectation(description: "Expectation-Failure")
        remoteDataStore.getAPODList(paramater: parameter) { (result) in
            switch result {
            case .success:
                XCTFail("Return value should not be success type")
            case .failure(let failure):
                expectFailure.fulfill()
                XCTAssert((failure as Any) is Error, "return value should not be error type")
            }
        }
        wait(for: [expectFailure], timeout: 1.0)
    }
}
