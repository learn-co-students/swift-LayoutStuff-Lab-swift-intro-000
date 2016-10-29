//
//  ViewController.swift
//  Frames
//
//  Created by Michael Dippery on 8/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var yellowSquare: UIView?

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var frameXLabel: UILabel!
    
    @IBOutlet weak var frameYLabel: UILabel!
    
    @IBOutlet weak var boundsXLabel: UILabel!
    
    @IBOutlet weak var boundsYLabel: UILabel!
    
    @IBOutlet weak var frameXSlider: UISlider!
    
    @IBOutlet weak var frameYSlider: UISlider!
    
    @IBOutlet weak var boundsXSlider: UISlider!
    
    @IBOutlet weak var boundsYSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        updateSliders()
        updateYellowSquare()
    }

    fileprivate func updateLabels() {
        let frame = imageView.frame
        let bounds = imageView.bounds

        frameXLabel.text = "frame x = \(frame.origin.x)"
        frameYLabel.text = "frame y = \(frame.origin.y)"

        boundsXLabel.text = "bounds x = \(bounds.origin.x)"
        boundsYLabel.text = "bounds y = \(bounds.origin.y)"
    }

    fileprivate func updateSliders() {
        let frame = imageView.frame
        let superFrame = imageView.superview!.frame
        let bounds = imageView.bounds

        frameXSlider.maximumValue = Float(superFrame.size.width)
        frameYSlider.maximumValue = Float(superFrame.size.height)
        frameXSlider.value = Float(frame.origin.x)
        frameYSlider.value = Float(frame.origin.y)

        boundsXSlider.maximumValue = Float(bounds.size.width)
        boundsYSlider.maximumValue = Float(bounds.size.height)
        boundsXSlider.value = Float(bounds.origin.x)
        boundsYSlider.value = Float(bounds.origin.y)
    }

    fileprivate func updateYellowSquare() {
        guard yellowSquare == nil else { return }
        let origin = CGPoint(x: 0.0, y: 0.0)
        let size = CGSize(width: 20.0, height: 20.0)
        let rect = CGRect(origin: origin, size: size)
        yellowSquare = UIView(frame: rect)
        yellowSquare!.backgroundColor = UIColor.yellow
        imageView.addSubview(yellowSquare!)
    }

    @IBAction func frameXChanged(_ sender: UISlider) {
        imageView.frame.origin.x = CGFloat(sender.value)
        updateLabels()
    }

    @IBAction func frameYChanged(_ sender: UISlider) {
        imageView.frame.origin.y = CGFloat(sender.value)
        updateLabels()
    }

    @IBAction func boundsXChanged(_ sender: UISlider) {
        imageView.bounds.origin.x = CGFloat(sender.value)
        updateLabels()
    }

    @IBAction func boundsYChanged(_ sender: UISlider) {
        imageView.bounds.origin.y = CGFloat(sender.value)
        updateLabels()
    }
}
