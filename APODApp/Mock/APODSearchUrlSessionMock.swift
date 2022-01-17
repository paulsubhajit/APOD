//
//  APODSearchUrlSessionMock.swift
//  APODApplication
//


import Foundation

class APODSearchUrlSessionMock {
    class func getAPODList(resultType: ServerAPIMockResult) -> APIRequestExecuterProtocol {
        let url = URL(string: "test")
        switch resultType {
        case .apiSuccess:
            var longformListArray = [[String: Any]]()
            let lfDic1: [String: Any] = [
                "lf":"Federal Bureau of Investigation"
            ]
            let lfDic2: [String: Any] = [
                "lf":"Frontal Behavioral Inventory"
            ]
            longformListArray.append(lfDic1)
            longformListArray.append(lfDic2)
            var apodSearchListArray = [[String: Any]]()
            let dic: [String: Any] = [
                "sf":"FBI",
                "lfs":longformListArray
            ]
            apodSearchListArray.append(dic)
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: apodSearchListArray, options: .prettyPrinted)
                return NSURLSession.prepareWithMockedURLSession(url: url!, data: jsonData, responseCode: 200)
            } catch {
                return NSURLSession.prepareWithMockedURLSession(url: url!, data: nil, responseCode: 500, error: .error500)
            }
            
        case .apiError:
            return NSURLSession.prepareWithMockedURLSession(url: url!, data: nil, responseCode: 401, error: .error401)
        case .apiErrorNil:
            let apodArray: [String] = ["A"]
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: apodArray, options: .prettyPrinted)
                return NSURLSession.prepareWithMockedURLSession(url: url!, data: jsonData, responseCode: 200)
            } catch {
                return NSURLSession.prepareWithMockedURLSession(url: url!, data: nil, responseCode: 500, error: .error500)
            }
        case .apiSuccessWithEmptyArray:
            let apodArray: [String: Any] = [:]
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: apodArray, options: .prettyPrinted)
                return NSURLSession.prepareWithMockedURLSession(url: url!, data: jsonData, responseCode: 200)
            } catch {
                return NSURLSession.prepareWithMockedURLSession(url: url!, data: nil, responseCode: 500, error: .error500)
            }
        default:
            return NSURLSession.prepareWithMockedURLSession(url: url!, data: nil, responseCode: 400, error: .error400)    }
    }
}
