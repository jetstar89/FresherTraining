//
//  DayTableViewCell.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/10/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class TimeKeepingTableViewCell: UITableViewCell {

    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var checkInLabel: UILabel!
    @IBOutlet weak var checkOutLabel: UILabel!
    @IBOutlet weak var timeWorkingLabel: UILabel!
    @IBOutlet weak var checkOutStatus: UILabel!
    @IBOutlet weak var checkOutRequest: UILabel!
    @IBOutlet weak var timeVacationLabel: UILabel!
    @IBOutlet weak var reasonCommentLabel: UILabel!
    @IBOutlet weak var locationCommentLabel: UILabel!
    @IBOutlet weak var vacationTypeImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setIsOnWeekend(isOnWeekend: Bool) {
        weekdayLabel.textColor = isOnWeekend ? UIColor.watermelon : UIColor.windowsBlue
        
        let border = CALayer()
        let width = CGFloat(1.0)
        
        border.frame = CGRect(x: 0, y: 0, width: weekdayLabel.frame.width, height: weekdayLabel.frame.height)
        border.borderColor = isOnWeekend ? UIColor.watermelon.cgColor : UIColor.windowsBlue.cgColor
        border.borderWidth = width
        
        weekdayLabel.layer.addSublayer(border)
        weekdayLabel.layer.masksToBounds = true
        
        dayLabel.backgroundColor = isOnWeekend ? UIColor.watermelon : UIColor.windowsBlue
    }
    
    func setData(_ cellData: CellData, cellForRowAt indexPath: IndexPath) {
        let day = indexPath.row + 2
        
        weekdayLabel.text = day <= 7 ? "T" + (day).description : "CN"
        setIsOnWeekend(isOnWeekend: day > 6)
        
        dayLabel.text = cellData.day.description
        checkInLabel.text = cellData.checkIn
        checkOutLabel.text = cellData.checkOut
        timeWorkingLabel.text = cellData.timeWorking.description
        checkOutRequest.isHidden = cellData.requestStatus == 0
        checkOutLabel.textColor = cellData.requestStatus == 0 ? UIColor.black : UIColor.squash
        checkOutStatus.isHidden = !(cellData.checkIn != "-" && cellData.checkOut == "-")
        reasonCommentLabel.isHidden = cellData.reasonComment != "Làm bù"
        locationCommentLabel.isHidden = cellData.locationComment != "Ngoài công ty"
        
        timeVacationLabel.isHidden = cellData.timeVacation == 0
        vacationTypeImageView.isHidden = cellData.timeVacation == 0
        
        switch cellData.vacationType {
        case 0:
            vacationTypeImageView.image = #imageLiteral(resourceName: "icPhepCoLuong")
            break
            
        case 1:
            vacationTypeImageView.image = #imageLiteral(resourceName: "icPhepKoLuong")
            break
        default:
            break
        }
    }
    
}
