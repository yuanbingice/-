//
//  DColumnCollectionViewCell.swift
//  douyuDemo
//
//  Created by ice on 2016/10/19.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit


//栏目页面的自定 contentViewcell
class DColumnCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    //配置cell
    func configureWithModel(model: DcolumnDataModel){
        
        imageView.setImageWithURL(NSURL(string: model.game_icon!), placeholder: UIImage(named: "Image_no_data"))
        
        titleLabel.text = model.game_name
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

}
