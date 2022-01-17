//
//  APODSearchRepositoryContainerFactory.swift
//  APODApplication
//


import Foundation

/**
 This structure is to be used to prepare repo container and it's dependencies
 */

struct APODSearchRepositoryContainerFactory {
    func makeRepositoryContainerFactory() -> APODSearchRepositoryContainerProtocol {
        APODSearchRepositoryContainer(apodSearchRepository: APODSearchRepositoryFactory().makeMessageCenterRepository())
        
    }
}
