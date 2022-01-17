//
//  APODAPIHandlerProtocol.swift
//  APODApplication
//


import Foundation
/**
 This protocol contains all the methods and behaviour required to be define in APODAPIHandlerProtocol.
 */
protocol APODAPIHandlerProtocol {
    /**
     This is intialiser, to be used by the calls to initalise it's dependencies
     - Parameter session: `OEAPIRequestExecutableProtocol`, session instance
     - Parameter remoteMapper: `OERemoteMappable`, remote mapper instance
     */
    init(session: APIRequestExecuterProtocol, remoteMapper: RemoteMappable)
    
    func getAPODList(paramater: APODSearchParamater, _ completion: @escaping ((Result<APODsUsablesModel, Error>) -> Void))
    
}
extension APODAPIHandlerProtocol {
    init(session: APIRequestExecuterProtocol = NSURLSession.shared, remoteMapper: RemoteMappable) {
        self.init(session: session, remoteMapper: remoteMapper)
    }
}

