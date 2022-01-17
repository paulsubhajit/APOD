//
//  APODSearchInteractorMock.swift
//  APODApplication
//


import Foundation
class APODSearchInteractorMock: APODSearchInteractable {
    var isgetAPODListCalled: Bool = false
    func getAPODList(searchStr: String) {
        isgetAPODListCalled = true
    }
}
