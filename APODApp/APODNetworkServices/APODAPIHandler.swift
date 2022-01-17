//
//  APODAPIHandler.swift
//  APODApplication
//


import Foundation
class APODAPIHandler: APODAPIHandlerProtocol {
    private let _mapper: RemoteMappable
    ///session: Instance of OEURLSession.
    private var _session: APIRequestExecuterProtocol
    ///session: Instance of an array. Which contains object of URLSessionTask type.
    private var _sessionTasks: [URLSessionTask] = []
    // initialiser
    required init(session: APIRequestExecuterProtocol  = NSURLSession.shared, remoteMapper: RemoteMappable) {
        self._session = session
        self._mapper = remoteMapper
    }
    func getAPODList(paramater: APODSearchParamater, _ completion: @escaping ((Result<APODsUsablesModel, Error>) -> Void)) {
        let fetchRequestCreator = APODSearchRequestCreater(params: paramater)
        do {
            if let urlRequest = try APIURLRequestCreater().createRequest(request: fetchRequestCreator) {
                self._session.dataTaskRequest(from: urlRequest){ [self] (data, response, error) in
                    let response = APIResponseParser.init((r: response, d: data, e: error), for: fetchRequestCreator)
                    switch response {
                    case .data(data: let data):
                        do {
                            let apodList = try JSONDecoder().decode(APODsParsableModel.self, from: data)
                            guard let apodModel = _mapper.mapParsableToUsable(apodList) as? APODsUsablesModel else {
                                completion(.failure(MappingError.failedParsableToUsable))
                                return
                            }
                            completion(.success(apodModel))
                        } catch let error {
                            completion(.failure(error))
                        }
                    case .error(_, let error):
                        if let err = error {
                            completion(.failure(err))
                        } else {
                            completion(.failure(APODApplicationError.unknownError))
                        }
                    default: break
                        
                    }
                }
            }
        } catch let error {
            completion(.failure(error))
        }
    }
}
