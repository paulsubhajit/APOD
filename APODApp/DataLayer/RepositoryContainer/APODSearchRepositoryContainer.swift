//
//  APODSearchRepositoryContainer.swift
//  APODApplication
//


import Foundation

protocol APODSearchRepositoryContainerProtocol: AnyObject {
    func getAPODList(searchStr: String,_ completion: @escaping ((Result<APODsUsablesModel, Error>) -> Void))
}

final class APODSearchRepositoryContainer: APODSearchRepositoryContainerProtocol {
    private let apodSearchRepository: APODSearchRepositorySource?
    // Initializer
    required init(apodSearchRepository: APODSearchRepositorySource?) {
        self.apodSearchRepository = apodSearchRepository
       
    }
    func getAPODList(searchStr: String,_ completion: @escaping ((Result<APODsUsablesModel, Error>) -> Void)) {
        apodSearchRepository?.fetchAPODList(searchDate: searchStr, completion)
    }
}

