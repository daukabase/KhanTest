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
import YandexMapKitSearch

final class SalonViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var worktimeLabel: UILabel!
    @IBOutlet weak var contactsLabel: UILabel!
    @IBOutlet weak var mapView: YMKMapView!
    
    lazy var activityIndicatorView: UIView = {
        // TODO: refactor, create new file
        let activityView = UIView()
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.startAnimating()
        activityView.addSubview(indicator)
        activityView.backgroundColor = .white
        activityView.isHidden = true
        return activityView
    }()
    
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
        activityIndicatorView.pin.all()
        activityIndicatorView.subviews.first?.pin.center()
    }
    
    private func commonInit() {
        view.addSubview(activityIndicatorView)
        imageView.layer.cornerRadius = 3
        imageView.dropShadow()
        setupMap()
    }
    
    private func setupMap() {
        // TODO: configure location display
        
        let TARGET_LOCATION = YMKPoint(latitude: 59.945933, longitude: 30.320045)
        
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(target: TARGET_LOCATION, zoom: 15, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
            cameraCallback: nil)
    }
    
    private func loadData() {
        guard let id = salonId else {
            return
        }
        activityIndicatorView.isHidden = false
        service.fetchSalon(with: String(id)) { [weak self] salon in
            self?.salon = salon
            self?.updateUI()
            self?.activityIndicatorView.isHidden = true
        }
    }
    
    private func updateUI() {
        guard let salon = salon else {
            return
        }
        
        nameLabel.text = salon.name
        addressLabel.text = salon.addressText
        contactsLabel.text = salon.phoneNumbers.joined(separator: "\n")
        worktimeLabel.text = salon.worktime
    }
    
}
