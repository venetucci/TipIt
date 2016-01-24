//
//  RatingControl.swift
//  tips
//
//  Created by Michelle Harvey on 1/24/16.
//  Copyright © 2016 Michelle Venetucci Harvey. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    var spacing = 5
//    var faces = ["good", "great", "amazing"]
    var faces = 3
    
    
    // MARK: Initialization
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus some spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledGoodImage = UIImage(named: "filledGood")
        let emptyGoodImage = UIImage(named: "emptyGood")
        let filledGreatImage = UIImage(named: "filledGreat")
        let emptyGreatImage = UIImage(named: "emptyGreat")
        let filledAmazingImage = UIImage(named: "filledAmazing")
        let emptyAmazingImage = UIImage(named: "emptyAmazing")
        
        for _ in 0..<faces {
            let button = UIButton()
            
            button.setImage(emptyGoodImage, forState: .Normal)
            button.setImage(filledGoodImage, forState: .Selected)
            button.setImage(filledGoodImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * faces
        
        return CGSize(width: width, height: buttonSize)
    }
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("button pressed")
        rating = ratingButtons.indexOf(button)!
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index == rating
        }
    }

}
