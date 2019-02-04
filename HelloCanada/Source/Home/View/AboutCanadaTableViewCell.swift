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
        return label
    }()

    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 10
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

        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(descriptionImageView)

        setUILayout()
    }

    func setUILayout() {

        descriptionImageView.snp.makeConstraints { (make) in

            make.top.equalTo(24)
            make.left.equalTo(16)
            make.width.equalTo(75)
            make.height.equalTo(75)
        }

        titleLabel.snp.makeConstraints { (make) in

            make.top.equalTo(24)
            make.left.equalTo(descriptionImageView.snp.right).offset(16)
//            make.right.equalTo(16)
        }

        descriptionLabel.snp.makeConstraints { (make) in

            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(descriptionImageView.snp.right).offset(16)
            make.right.equalTo(16)
        }
    }

}
