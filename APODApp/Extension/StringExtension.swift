//
//  StringExtension.swift
//  APODApplication
//

import Foundation
public extension String {
    var isValidURL: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.endIndex.utf16Offset(in: self))) {
                return match.range.length == self.endIndex.utf16Offset(in: self)
            } else {
                return false
            }
        } catch _ {
            return false
        }
    }
    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
    
    var youtubeID: String? {
        guard let url = self.removingPercentEncoding else { return nil }
        do {
            let regex = try NSRegularExpression.init(pattern: "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)", options: .caseInsensitive)
            let range = NSRange(location: 0, length: url.count)
            if let matchRange = regex.firstMatch(in: url, options: .reportCompletion, range: range)?.range {
                let matchLength = (matchRange.lowerBound + matchRange.length) - 1
                if range.contains(matchRange.lowerBound) &&
                    range.contains(matchLength) {
                    let start = url.index(url.startIndex, offsetBy: matchRange.lowerBound)
                    let end = url.index(url.startIndex, offsetBy: matchLength)
                    return String(url[start...end])
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
