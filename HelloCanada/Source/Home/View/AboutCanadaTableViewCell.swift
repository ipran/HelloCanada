//
//  AboutCanadaTableViewCell.swift
//  HelloCanada
//
//  Created by Pranil on 2/4/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import UIKit
import SnapKit

class AboutCanadaTableViewCell: UITableViewCell {
    // Declarations
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        return label
    }()

    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center 
        return label
    }()

    let descriptionImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none

        setUpView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpView() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(descriptionImageView)

        setUILayout()
    }

    func setUILayout() {
        descriptionImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(16)
            make.centerX.equalTo(self)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }

        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionImageView.snp.bottom).offset(8)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).inset(16)
        }

        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).inset(16)
            make.bottom.equalTo(self).inset(16)
        }
    }
}
