//
//  AboutCanadaTableViewCell.swift
//  HelloCanada
//
//  Created by Pranil on 2/4/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import UIKit

class AboutCanadaTableViewCell: UITableViewCell {

    var titleLabel : UILabel!
    var descriptionLabel: UILabel!
    var descriptionImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpView()
    }

    func setUpView() {

        //setup title label
        titleLabel = UILabel(frame: CGRect(x: 16, y: 8, width: self.frame.width, height: 44))
        self.addSubview(titleLabel)
        //setup description label
        descriptionLabel = UILabel(frame: CGRect(x: 16, y: 8, width: self.frame.width, height: 44))
        self.addSubview(descriptionLabel)
        //setup imageview
        descriptionImageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 50, height: 50))
        self.addSubview(descriptionImageView)
    }

}
