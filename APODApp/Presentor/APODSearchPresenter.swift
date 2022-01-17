//
//  APODSearchPresenter.swift
//  APODApplication
//


import Foundation

/// This protocol will contain presenter logics methods.
///
/// Types that conform to the `APODSearchPresentable` protocol, that class can implement the methods.
protocol APODSearchPresentable {
    // TODO: Declare methods the presenter will implement.
    func getAPODList(inputStr: String)
}

/// This protocol will contain display logics callback methods.
///
/// Types that conform to the `APODSearchViewControllerListener` protocol, that class can implement the methods.
/// This protocls will help to view controller to display the data.
protocol APODSearchViewControllerListener: AnyObject {
    // TODO: Declare methods the presenter can invoke the viewcontroller to display data.
    func displayMessages(viewModels: APODsUsablesModel)
    func displayErrorMessages(error: Error)
}

/// This class will handle presenter logic implemenation.
///
/// Presenter will help to get the data from interactor and responsible to convert the entity into viewmodel.
/// We are handling router from presenter to move other screens.
/// If we want do handle other validation and data formating, that must be handle by helper/common/supporter classes.
final class APODSearchPresenter {
    
    private var interactor: APODSearchInteractable
    private unowned var viewController: APODSearchViewControllerListener
    
    init(interactor: APODSearchInteractable,
         viewController: APODSearchViewControllerListener) {
        self.interactor = interactor
        self.viewController = viewController
    }
    
    deinit { print("APODSearchPresenter") }
}

extension APODSearchPresenter: APODSearchPresentable {
    func getAPODList(inputStr: String) {
        self.interactor.getAPODList(searchStr: inputStr)
    }
}

extension APODSearchPresenter: APODSearchPresenterListener {
    func displayMessages(viewModels: APODsUsablesModel) {
        viewController.displayMessages(viewModels: viewModels)
    }
    func displayErrorMessages(error: Error) {
        viewController.displayErrorMessages(error: error)
    }
}
