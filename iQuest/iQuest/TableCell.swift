//
//  TableCell.swift
//  iQuest
//
//  Created by Philip GeLinas on 7/13/19.
//  Copyright © 2019 Philip GeLinas Inc. All rights reserved.
//

import UIKit

struct TableCell {
    var image: UIImage
    init(fromImage val: UIImage) {
        image = UIImage(named: "\(val)")!
    }
}
