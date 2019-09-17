//
//  ActivityIndicator.swift
//  KhanTest
//
//  Created by Daulet on 17/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import UIKit
import PinLayout

class ActivityView: UIView {
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.startAnimating()
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(activityIndicatorView)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicatorView.pin.center()
    }
    
    func start() {
        isHidden = false
    }
    
    func stop() {
        isHidden = true
    }
    
}
