//
//  APODAPIHandlerMock.swift
//  APODApplication
//


import Foundation
class APODAPIHandlerMock: APODAPIHandlerProtocol {
    private let fetchAPODSearchAPIResult: APODAPIMockResult
    init(fetchAPODSearchAPIResult: APODAPIMockResult = .successWithValue) {
        self.fetchAPODSearchAPIResult = fetchAPODSearchAPIResult
    } 
    func getAPODList(paramater: APODSearchParamater, _ completion: @escaping ((Result<APODsUsablesModel, Error>) -> Void)) {
        let model = APODsUsablesModel(title: "The Butterfly Nebula from Hubble", imageUrl: "https://apod.nasa.gov/apod/image/1410/butterflyblue_hst_960.jpg", explanation: "The bright clusters and nebulae of planet Earth's night sky are often named for flowers or insects. Though its wingspan covers over 3 light-years, NGC 6302 is no exception. With an estimated surface temperature of about 250,000 degrees C, the dying central star of this particular planetary nebula has become exceptionally hot, shining brightly in ultraviolet light but hidden from direct view by a dense torus of dust.  This sharp close-up of the dying star's nebula was recorded in 2009 by the Hubble Space Telescope's Wide Field Camera 3, and is presented here in reprocessed colors.  Cutting across a bright cavity of ionized gas, the dust torus surrounding the central star is near the center of this view, almost edge-on to the line-of-sight. Molecular hydrogen has been detected in the hot star's dusty cosmic shroud. NGC 6302 lies about 4,000 light-years away in the arachnologically correct constellation of the Scorpion (Scorpius).    APOD Wall Calendar: Nebulas and Star Clusters", date: "2014-10-01",mediaType: .image)
        switch fetchAPODSearchAPIResult {
        case .successWithValue:
            completion(.success(model))
        case .failureWithError:
            completion(.failure(APODApplicationError.invalidResponse))
        }
    }
}
