//
//  APODSearchRepositoryContainerTest.swift
//  APODApplicationTests
//


import XCTest
@testable import APODApp

class APODSearchRepositoryContainerTest: XCTestCase {
    func test_APODSearchRepositoryContainerTest_Success() {
        let apodRepoMock = APODSearchRepositoryMock()
        let repoContainer = APODSearchRepositoryContainer(apodSearchRepository: apodRepoMock)
        let expectSuccess = XCTestExpectation(description: "Expectation-Success")
        repoContainer.getAPODList(searchStr: "FBI", { (result) in
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
    func test_APODSearchRepositoryContainerTest_Failure() {
        let apodRepoMock = APODSearchRepositoryMock(fetchAPODSearchRepositoryResult: .failureWithError)
        let repoContainer = APODSearchRepositoryContainer(apodSearchRepository: apodRepoMock)
        let expectFailure = XCTestExpectation(description: "Expectation-Failure")
        repoContainer.getAPODList(searchStr: "FBI", { (result) in
            switch result {
            case .success:
                XCTFail("Return value should not be success type")
            case .failure(let error):
                expectFailure.fulfill()
                XCTAssert((error as Any) is Error, "return value should not be error type")
            }
            self.wait(for: [expectFailure], timeout: 2.0)
        })
        
    }
}
