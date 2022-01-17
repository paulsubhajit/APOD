//
//  APODSearchView.swift
//  APODApplication
//



import UIKit
import youtube_ios_player_helper
protocol APODSearchTextProtocol: AnyObject {
    func apodSearchText(searchText: Date)
}
/// This class will contain the UI elements.
class APODSearchView: UIView {
    @IBOutlet var apodDatePicker: UIDatePicker!
    @IBOutlet var apodImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var explanationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var apodPlayer: YTPlayerView!
    
    weak var delegate: APODSearchTextProtocol?
    func configureView() {
        apodDatePicker.preferredDatePickerStyle = .compact
        apodDatePicker.datePickerMode = .date
        apodDatePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        apodDatePicker.backgroundColor = .clear
        apodPlayer.delegate = self
        titleLabel.sizeToFit()
        explanationLabel.numberOfLines = 0
        explanationLabel.sizeToFit()
    }
    
    /// This function is used to update the view with utn view model data.
    /// - Parameter viewModel: instance of type **MessageViewModel** that holds utn details.
    func updateAPODSearchViewModel(viewModels: APODsUsablesModel) {
        titleLabel.text = viewModels.title
        explanationLabel.text = viewModels.explanation
        dateLabel.text = viewModels.date
        let mediaType = viewModels.mediaType
        switch mediaType{
        case .video:
            apodImageView.sendSubviewToBack(apodPlayer)
            if let videoId = viewModels.imageUrl?.youtubeID{
                apodPlayer.load(withVideoId: videoId, playerVars: ["playsinline": "1"])
            }
        case .image:
            apodPlayer.bringSubviewToFront(apodImageView)
            if let imageUrl = viewModels.imageUrl {
                apodImageView.downloadImageFrom(link:  imageUrl, contentMode: UIView.ContentMode.scaleAspectFill)
            }
        }
    }
    
    deinit { print("APODSearchView") }
    
}
extension APODSearchView {
    @objc func dateChanged(_ sender: UIDatePicker) {
        delegate?.apodSearchText(searchText: sender.date)
    }
}

extension APODSearchView: YTPlayerViewDelegate {
    func playerViewPreferredWebViewBackgroundColor(_ playerView: YTPlayerView) -> UIColor {
        return UIColor.black
    }
}
