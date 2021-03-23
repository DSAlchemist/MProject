//
//  MyGroupsTableViewCell.swift
//  MProject
//
//  Created by Danil G. on 06.03.2021.
//

import UIKit
import Kingfisher

class MyGroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
//    @IBOutlet weak var groupImageView: SetImageShadow!
  
    
    func configure(with group: Community) {
        self.groupName.text = group.groupName
        let url = URL(string: group.groupImage)
        self.groupImage.kf.setImage(with: url)
    }
}
