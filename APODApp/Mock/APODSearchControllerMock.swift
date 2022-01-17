//
//  APODSearchControllerMock.swift
//  APODApplication
//


import Foundation
class APODSearchControllerMock: APODSearchViewControllerListener {
    var isdisplayMessagesCalled: Bool = false
    var displayModel: APODsUsablesModel?
    func displayMessages(viewModels: APODsUsablesModel) {
        isdisplayMessagesCalled = true
        displayModel = viewModels
    }
    var isdisplayErrorMessagesCalled: Bool = false
    var errorMessage: Error?
    func displayErrorMessages(error: Error) {
        isdisplayErrorMessagesCalled = true
        errorMessage = error
    }
}
