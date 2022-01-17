//
//  APODSearchRemoteDataMapper.swift
//  APODApplication
//


import Foundation
enum MediaType{
    case video
    case image
}
class APODSearchRemoteDataMapper: RemoteMappable {
    lazy var mapParsableToUsable: ParsableToUsable = { parsable in
        // check the type of usable
        if let item = parsable as? APODsParsableModel {
            return self.mapToDomain(item)
        }
        return  nil
    }
    lazy var mapParsablesToUsables: ParsablesToUsables = { parsables in
        var usables = [Usable]()
        if let items = parsables as? [APODsParsableModel] {
            for item in items {
                usables.append(self.mapToDomain(item))
            }
           
        }
       return usables
    }
    
    lazy var mapUsableToParsable: UsableToParsable = { _ in
        return nil
    }
    lazy var mapUsablesToParsables: UsablesToParsables = { usables in
        return nil
    }
    private func mapToDomain(_ object: APODsParsableModel) -> APODsUsablesModel {
        
        return APODsUsablesModel(title: object.title, imageUrl: object.url, explanation: object.explanation, date: object.date, mediaType:  object.media_type == "video" ? .video : .image)
        
       
    }
}
