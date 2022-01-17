//
//  APODSearchRemoteManager.swift
//  APODApplication
//


import Foundation

/// This protocol handles Message Center api calls.
protocol APODSearchRemoteStoreProtocol {
    func getAPODList(paramater: APODSearchParamater, _ completion: @escaping ((Result<APODsUsablesModel, Error>) -> Void))
}
class APODSearchRemoteStore: APODSearchRemoteStoreProtocol {
    private let apiHandler: APODAPIHandlerProtocol
    required init(apiHandler: APODAPIHandlerProtocol) {
        self.apiHandler = apiHandler
    }
    func getAPODList(paramater: APODSearchParamater, _ completion: @escaping ((Result<APODsUsablesModel, Error>) -> Void)) {
        apiHandler.getAPODList(paramater: paramater, completion)
    }
}
