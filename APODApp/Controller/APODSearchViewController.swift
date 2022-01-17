//
//  APODSearchViewController.swift
//  APODApplication
//


import UIKit

/// This class will contain the attributes and behaviours for module
class APODSearchViewController: UIViewController {
    var presenter: APODSearchPresentable?
    override func viewDidLoad() {
        super.viewDidLoad()
        APODSearchBuilder().configure(viewController: self)
        (self.view as? APODSearchView)?.configureView()
        (self.view as? APODSearchView)?.delegate = self
        let currentDate = Date()
        let str = convertDateToStringFormat(date: currentDate)
        loadAPODList(searchText: str)
    }
    
    deinit { print("APODSearchViewController") }
}

private extension APODSearchViewController {
    
    /// Fetch the data and reload the view.
    func loadAPODList(searchText: String) {
       view.activityStartAnimating(activityColor: UIColor.white, backgroundColor: UIColor.black.withAlphaComponent(0.25))
        presenter?.getAPODList(inputStr: searchText)
    }
}

extension APODSearchViewController: APODSearchViewControllerListener {
    func displayMessages(viewModels: APODsUsablesModel) {
        DispatchQueue.main.async {
            (self.view as? APODSearchView)?.updateAPODSearchViewModel(viewModels: viewModels)
             self.view.activityStopAnimating()
        }
    }
    
    func displayErrorMessages(error: Error) {
        DispatchQueue.main.async {
        let dialogMessage = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
         dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
        self.view.activityStopAnimating()
        }
    }
}
extension APODSearchViewController: APODSearchTextProtocol {
    func apodSearchText(searchText: Date) {
        let str = convertDateToStringFormat(date: searchText)
        loadAPODList(searchText: str)
        self.dismiss(animated: true, completion: nil)
    }
}

extension APODSearchViewController {
    func convertDateToStringFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let str = dateFormatter.string(from: date)
        return str
    }
}
