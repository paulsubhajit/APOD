//
//  APODSearchRequestCreater.swift
//  APODApplication
//


import Foundation


public struct APODSearchRequestCreater: APIConfigurableProtocol {
    let params: APODSearchParamater
    
     init (params: APODSearchParamater) {
        self.params = params
    }
     var responseDataType: ResponseDataType {
        return .data
    }
    public var path: String {
        let baseurl = "https://api.nasa.gov/planetary/apod?api_key=hkUm7zeLlDZsy4I8MCXHUjPIrYfBy6ovffeRhbgj&date=\(params.date)"
        return baseurl
    }
     var method: HTTPMethodsType {
        return .get
    }
   
}
