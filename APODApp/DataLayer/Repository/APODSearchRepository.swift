//
//  APODSearchRepository.swift
//  APODApplication
//


protocol APODSearchRepositorySource: AnyObject {
    func fetchAPODList(searchDate: String,_ completion: @escaping ((Result<APODsUsablesModel, Error>) -> Void))
}

final class APODSearchRepository: APODSearchRepositorySource {
    private let apodSearchRemote: APODSearchRemoteStoreProtocol?
    required init(apodSearchRemote: APODSearchRemoteStoreProtocol?) {
        self.apodSearchRemote = apodSearchRemote

    }
    func fetchAPODList(searchDate: String,_ completion: @escaping ((Result<APODsUsablesModel, Error>) -> Void)) {
       let params = APODSearchParamater(date: searchDate)
        apodSearchRemote?.getAPODList(paramater: params, completion)
    }
}

