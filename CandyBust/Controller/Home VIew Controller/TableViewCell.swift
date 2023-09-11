//
//  TableViewCell.swift
//  CandyBust
//
//  Created by koshal singh shekhawat on 11/09/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    //MARK: -> Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var buttonView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
