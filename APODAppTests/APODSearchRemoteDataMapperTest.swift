//
//  APODSearchRemoteDataMapperTest.swift
//  APODApplicationTests
//

import XCTest
@testable import APODApp

class APODSearchRemoteDataMapperTest: XCTestCase {
    private var remoteDataMapper = APODSearchRemoteDataMapper()
    func test_ParsablesToUsables() {
        
        let parsableModel = APODsParsableModel(concepts: "", copyright: "", date: "2014-10-01", explanation: "The bright clusters and nebulae of planet Earth's night sky are often named for flowers or insects. Though its wingspan covers over 3 light-years, NGC 6302 is no exception. With an estimated surface temperature of about 250,000 degrees C, the dying central star of this particular planetary nebula has become exceptionally hot, shining brightly in ultraviolet light but hidden from direct view by a dense torus of dust.  This sharp close-up of the dying star's nebula was recorded in 2009 by the Hubble Space Telescope's Wide Field Camera 3, and is presented here in reprocessed colors.  Cutting across a bright cavity of ionized gas, the dust torus surrounding the central star is near the center of this view, almost edge-on to the line-of-sight. Molecular hydrogen has been detected in the hot star's dusty cosmic shroud. NGC 6302 lies about 4,000 light-years away in the arachnologically correct constellation of the Scorpion (Scorpius).    APOD Wall Calendar: Nebulas and Star Clusters", hdurl: "https://apod.nasa.gov/apod/image/1410/butterflyblue_hst_960.jpg", media_type: "image", service_version: "", title: "The Butterfly Nebula from Hubble", url: "https://apod.nasa.gov/apod/image/1410/butterflyblue_hst_960.jpg")
        let usableModel = remoteDataMapper.mapParsableToUsable(parsableModel) as? APODsUsablesModel
        
        XCTAssert(usableModel?.title == parsableModel.title)
    }
    func test_ParsableToUsable() {
        let parsableModel = APODsParsableModel(concepts: "", copyright: "", date: "2014-10-01", explanation: "The bright clusters and nebulae of planet Earth's night sky are often named for flowers or insects. Though its wingspan covers over 3 light-years, NGC 6302 is no exception. With an estimated surface temperature of about 250,000 degrees C, the dying central star of this particular planetary nebula has become exceptionally hot, shining brightly in ultraviolet light but hidden from direct view by a dense torus of dust.  This sharp close-up of the dying star's nebula was recorded in 2009 by the Hubble Space Telescope's Wide Field Camera 3, and is presented here in reprocessed colors.  Cutting across a bright cavity of ionized gas, the dust torus surrounding the central star is near the center of this view, almost edge-on to the line-of-sight. Molecular hydrogen has been detected in the hot star's dusty cosmic shroud. NGC 6302 lies about 4,000 light-years away in the arachnologically correct constellation of the Scorpion (Scorpius).    APOD Wall Calendar: Nebulas and Star Clusters", hdurl: "https://apod.nasa.gov/apod/image/1410/butterflyblue_hst_960.jpg", media_type: "image", service_version: "", title: "The Butterfly Nebula from Hubble", url: "https://apod.nasa.gov/apod/image/1410/butterflyblue_hst_960.jpg")
        let usableModel = remoteDataMapper.mapParsableToUsable(parsableModel) as? APODsUsablesModel
        XCTAssert(usableModel?.title == parsableModel.title)
       
    }
    func test_UsableToParsable() {
        let model = APODsUsablesModel(title: "The Butterfly Nebula from Hubble", imageUrl: "https://apod.nasa.gov/apod/image/1410/butterflyblue_hst_960.jpg", explanation: "The bright clusters and nebulae of planet Earth's night sky are often named for flowers or insects. Though its wingspan covers over 3 light-years, NGC 6302 is no exception. With an estimated surface temperature of about 250,000 degrees C, the dying central star of this particular planetary nebula has become exceptionally hot, shining brightly in ultraviolet light but hidden from direct view by a dense torus of dust.  This sharp close-up of the dying star's nebula was recorded in 2009 by the Hubble Space Telescope's Wide Field Camera 3, and is presented here in reprocessed colors.  Cutting across a bright cavity of ionized gas, the dust torus surrounding the central star is near the center of this view, almost edge-on to the line-of-sight. Molecular hydrogen has been detected in the hot star's dusty cosmic shroud. NGC 6302 lies about 4,000 light-years away in the arachnologically correct constellation of the Scorpion (Scorpius).    APOD Wall Calendar: Nebulas and Star Clusters", date: "2014-10-01", mediaType: "image")
        let result = remoteDataMapper.mapUsableToParsable(model)
        XCTAssert(result == nil)
    }
    func test_UsablesToParsables() {
        let model = APODsUsablesModel(title: "The Butterfly Nebula from Hubble", imageUrl: "https://apod.nasa.gov/apod/image/1410/butterflyblue_hst_960.jpg", explanation: "The bright clusters and nebulae of planet Earth's night sky are often named for flowers or insects. Though its wingspan covers over 3 light-years, NGC 6302 is no exception. With an estimated surface temperature of about 250,000 degrees C, the dying central star of this particular planetary nebula has become exceptionally hot, shining brightly in ultraviolet light but hidden from direct view by a dense torus of dust.  This sharp close-up of the dying star's nebula was recorded in 2009 by the Hubble Space Telescope's Wide Field Camera 3, and is presented here in reprocessed colors.  Cutting across a bright cavity of ionized gas, the dust torus surrounding the central star is near the center of this view, almost edge-on to the line-of-sight. Molecular hydrogen has been detected in the hot star's dusty cosmic shroud. NGC 6302 lies about 4,000 light-years away in the arachnologically correct constellation of the Scorpion (Scorpius).    APOD Wall Calendar: Nebulas and Star Clusters", date: "2014-10-01", mediaType: "image")
        let result = remoteDataMapper.mapUsablesToParsables([model])
        XCTAssert(result == nil)
    }
}
