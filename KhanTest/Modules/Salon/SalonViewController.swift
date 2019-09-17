//
//  SalonViewController.swift
//  KhanTest
//
//  Created by Daulet on 14/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import UIKit
import PinLayout
import YandexMapKit

final class SalonViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var worktimeLabel: UILabel!
    @IBOutlet weak var contactsLabel: UILabel!
    @IBOutlet weak var mapView: YMKMapView!
    
    lazy var activityView = ActivityView(frame: .zero)
    
    var salonId: Int?
    lazy var service: SalonAbstractService = SalonService()
    
    private var salon: SalonDetailedInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        loadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        activityView.pin.all()
    }

}

private extension SalonViewController {

    func commonInit() {
        view.addSubview(activityView)
        imageView.layer.cornerRadius = 7
    }
    
    func loadData() {
        guard let id = salonId else {
            return
        }
        activityView.isHidden = false
        service.fetchSalon(with: String(id)) { [weak self] salon in
            self?.salon = salon
            self?.updateUI()
            self?.activityView.isHidden = true
            self?.setupMap(for: salon.location)
        }
    }
    
    func setupMap(for location: Location?) {
        guard let location = location else {
            mapView.isHidden = true
            return
        }
        let salonLocation = YMKPoint(latitude: location.latitude, longitude: location.longitude)
        let cameraPosition = YMKCameraPosition(target: salonLocation, zoom: Float(location.zoom), azimuth: 0, tilt: 0)
        mapView.mapWindow.map.move(
            with: cameraPosition,
            animationType: YMKAnimation(type: YMKAnimationType.linear, duration: 0),
            cameraCallback: nil
        )
    }
    
    func updateUI() {
        guard let salon = salon else {
            return
        }
        // Actually I can use DispatchGroup and load this images
        // after display it on view, but it will take time,
        // if its needed I can  implement it.
        if let imageURL = salon.picturesUrls.first {
            imageView.kf.setImage(with: URL(string: imageURL, relativeTo: URLs.main))
        }
        nameLabel.text = salon.name
        addressLabel.text = salon.addressText
        contactsLabel.text = salon.phoneNumbers.joined(separator: "\n")
        worktimeLabel.text = salon.worktime
    }
    
}
