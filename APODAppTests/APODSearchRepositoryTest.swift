//
//  APODSearchRepositoryTest.swift
//  APODApplicationTests
//


import XCTest
@testable import APODApp

class APODSearchRepositoryTest: XCTestCase {
    
    func test_APODSearchRepositoryTest_Success() {
        let remoteDataStore = APODSearchRemoteDatastoreMock()
        let repository = APODSearchRepository(apodSearchRemote: remoteDataStore)
        let expectSuccess = XCTestExpectation(description: "Expectation-Success")
        repository.fetchAPODList(searchDate: "FBI", { (result) in
            switch result {
            case .success(let apodList) :
                XCTAssert((apodList as Any) is APODsUsablesModel, "return value should be apodList")
                expectSuccess.fulfill()
            case .failure :
                XCTFail("Return value should not be error type")
            }
            self.wait(for: [expectSuccess], timeout: 2.0)
        })
    }
    func test_APODSearchRepositoryTest_Failure() {
        let remoteDataStore = APODSearchRemoteDatastoreMock(fetchAPODSearchRemoteResult: .failureWithError)
        let repository = APODSearchRepository(apodSearchRemote: remoteDataStore)
        let expectFailure = XCTestExpectation(description: "Expectation-Failure")
        repository.fetchAPODList(searchDate: "FBI", { (result) in
            switch result {
            case .success:
                XCTFail("Return value should not be success type")
            case .failure(let error):
                expectFailure.fulfill()
                XCTAssert((error as Any) is Error, "return value should be error type")
            }
            self.wait(for: [expectFailure], timeout: 2.0)
        })
        
    }

}
