//
//  APODSearchRepositoryFactory.swift
//  APODApplication
//


import Foundation


class APODSearchRepositoryFactory {
    public func makeMessageCenterRepository() -> APODSearchRepository {
        return APODSearchRepository(apodSearchRemote: makeRemoteDataSource())
    }
    public func makeRemoteDataSource() -> APODSearchRemoteStore? {
        return APODSearchRemoteStore(apiHandler: makeOrderAPIHandler())
    }
    public func makeOrderAPIHandler() -> APODAPIHandler {
        return APODAPIHandler(remoteMapper: APODSearchRemoteDataMapper())
    }
}
