//
//  APODSearchBuilder.swift
//  APODApplication
//


import Foundation
import UIKit

/// This protocol will contain builder logic methods.
protocol APODSearchBuildable {
    // TODO: Declare methods the builder will implement.
    func configure(viewController: APODSearchViewController)
}

/// This class will handle builder logic implemenation
///
/// Builder will help to injected the all the dependences, which will requried for module. For example:
///
///
/// It will reture the optional view controller.
final class APODSearchBuilder: APODSearchBuildable {
    
    func configure(viewController: APODSearchViewController) {
        let repositoryContainer = APODSearchRepositoryContainerFactory().makeRepositoryContainerFactory()
        let interactor = APODSearchInteractor(repositoryContainer: repositoryContainer)
        let presenter = APODSearchPresenter(interactor: interactor,
                                      viewController: viewController)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
    
    deinit { print("APODSearchBuilder") }
}
