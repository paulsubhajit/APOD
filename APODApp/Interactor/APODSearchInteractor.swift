//
//  APODSearchInteractor.swift
//  APODApplication
//


import Foundation

/// This protocol will contain business logics methods.
///
/// Types that conform to the `APODSearchInteractable` protocol, that class can implement the methods.
protocol APODSearchInteractable {
    // TODO: Declare methods the interactor will implement.
     func getAPODList(searchStr: String)
}

/// This protocol will contain presenter logics callback methods.
///
/// Types that conform to the `APODSearchPresenterListener` protocol, that class can implement the methods.
/// This protocls will help to presenter to present the data
protocol APODSearchPresenterListener: AnyObject {
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    func displayMessages(viewModels: APODsUsablesModel)
    func displayErrorMessages(error: Error)
}

/// This class will handle business logic implemenation.
///
/// Interactor will help to get the data from data layer (API/DataBase) and pass back to presenter to present the data.
/// If we want do handle other validation and data formating, that must be handle by helper/common/supporter classes.
///
/// - Note: This class must not contain more then a repository.
final class APODSearchInteractor {
    weak var presenter: APODSearchPresenterListener?
    private var repositoryContainer: APODSearchRepositoryContainerProtocol?

    // initaliser
    required init(repositoryContainer: APODSearchRepositoryContainerProtocol?) {
        self.repositoryContainer = repositoryContainer
    }
        
}

extension APODSearchInteractor: APODSearchInteractable {
    func  getAPODList(searchStr: String) {
        repositoryContainer?.getAPODList(searchStr: searchStr, {
              [weak self]  (result) in
                switch result {
                case .success(let apodsModel):
                    self?.presenter?.displayMessages(viewModels: apodsModel)
                case .failure(let error):
                    self?.presenter?.displayErrorMessages(error: error)
                }
            })
        }
}
