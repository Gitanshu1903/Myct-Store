//
//  OrderTableViewCell.swift
//  Order ApiCalling
//
//  Created by ERASOFT on 23/03/22.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var orderIdLabel: UILabel!
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var venderNameLabel: UILabel!
    @IBOutlet weak var paymentAmountLabel: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var orderStatus2: UILabel!
    @IBOutlet weak var venderImageView: UIImageView!
    @IBOutlet weak var slashLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
