//
//  SalonCell.swift
//  KhanTest
//
//  Created by Daulet on 14/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import UIKit
import Kingfisher

class SalonCell: UITableViewCell {
    
    // TODO: add ratings
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var salonImageView: UIImageView!
    @IBOutlet private weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func configure(model: SalonInfo) {
        nameLabel.text = model.name
        
        guard let urlString = model.pictureUrl else {
            return
        }
        let url = URL(string: urlString, relativeTo: URLs.main)
        salonImageView.kf.setImage(with: url)
    }

}

private extension SalonCell {
    
    func commonInit() {
        nameLabel.textColor = UIColor.blackText
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 3
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
    }
    
}
