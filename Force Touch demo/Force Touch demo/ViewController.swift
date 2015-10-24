//
//  ViewController.swift
//  Force Touch demo
//
//  Created by Ashley Mills on 23/10/2015.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var innerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let forceTouch = ForceTouchGestureRecognizer(target: self, action: "pressView:")
        view.addGestureRecognizer(forceTouch)
    }

    
    func pressView(gesture: ForceTouchGestureRecognizer) {
        
        switch gesture.state {
        case .Began:
            forceLabel.text = ""
        case .Changed:
            if let value = gesture.forceValue {
                forceLabel.text = "\(value)"
                let scale = 1-(value / 2)
                innerView.transform = CGAffineTransformMakeScale(scale, scale)
            }
        default:
            forceLabel.text = ""
            innerView.transform = CGAffineTransformIdentity
        }
    }
    

}

