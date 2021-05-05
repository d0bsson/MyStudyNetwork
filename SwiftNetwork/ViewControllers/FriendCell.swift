//
//  FriendCell.swift
//  SwiftNetwork
//
//  Created by Дэвид Бердников on 05.05.2021.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendSkillLabel: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    
    func configure(with result: Friend?) {
        friendNameLabel.text = result?.name
        DispatchQueue.global().async {
            guard let stringUrl = result?.photo else { return }
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.friendImage.image = UIImage(data: imageData)
            }
        }
    }
    
    
    
    
    
    
}
