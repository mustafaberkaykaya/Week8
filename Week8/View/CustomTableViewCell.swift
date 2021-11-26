//
//  CustomTableViewCell.swift
//  Week8
//
//  Created by Mustafa Berkay Kaya on 25.11.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var itemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setImage() -> UIImageView {
        return itemImage
    }

}
