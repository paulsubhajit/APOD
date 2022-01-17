
import Foundation
struct APODsParsableModel  {
    let concepts : String?
    let copyright : String?
    let date : String?
    let explanation : String?
    let hdurl : String?
    let media_type : String?
    let service_version : String?
    let title : String?
    let url : String?
}
extension APODsParsableModel : Parsable {
    enum CodingKeys: String, CodingKey {

        case concepts = "concepts"
        case copyright = "copyright"
        case date = "date"
        case explanation = "explanation"
        case hdurl = "hdurl"
        case media_type = "media_type"
        case service_version = "service_version"
        case title = "title"
        case url = "url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        concepts = try values.decodeIfPresent(String.self, forKey: .concepts)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        explanation = try values.decodeIfPresent(String.self, forKey: .explanation)
        hdurl = try values.decodeIfPresent(String.self, forKey: .hdurl)
        media_type = try values.decodeIfPresent(String.self, forKey: .media_type)
        service_version = try values.decodeIfPresent(String.self, forKey: .service_version)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }

}
