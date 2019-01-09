//
//  ViewController.swift
//  Frames
//
//  Created by Michael Dippery on 8/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var frameXSlider: UISlider!
    @IBOutlet weak var frameYSlider: UISlider!
    @IBOutlet weak var boundXSlider: UISlider!
    @IBOutlet weak var boundYSlider: UISlider!
    @IBOutlet weak var frameHeight: UISlider!
    @IBOutlet weak var frameWidth: UISlider!
    @IBOutlet weak var boundHeight: UISlider!
    @IBOutlet weak var boundWidth: UISlider!
    @IBOutlet weak var frameXLabel: UILabel!
    @IBOutlet weak var frameYLabel: UILabel!
    @IBOutlet weak var boundXLabel: UILabel!
    @IBOutlet weak var boundYLabel: UILabel!
    @IBOutlet weak var frameHeightLabel: UILabel!
    @IBOutlet weak var frameWidthLabel: UILabel!
    @IBOutlet weak var boundHeightLabel: UILabel!
    @IBOutlet weak var boundWidthLabel: UILabel!
    
    
    
    var yellowSquare: UIView?

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

        boundXLabel.text = "bounds x = \(bounds.origin.x)"
        boundYLabel.text = "bounds y = \(bounds.origin.y)"
        
        frameHeightLabel.text = "frame height = \(frame.height)"
        frameWidthLabel.text = "frame width = \(frame.width)"
        
        boundHeightLabel.text = "bounds height = \(bounds.height)"
        boundWidthLabel.text = "bounds width = \(bounds.width)"
        
    }

    fileprivate func updateSliders() {
        let frame = imageView.frame
        let superFrame = imageView.superview!.frame
        let bounds = imageView.bounds

        frameXSlider.maximumValue = Float(superFrame.size.width)
        frameYSlider.maximumValue = Float(superFrame.size.height)
        frameXSlider.value = Float(frame.origin.x)
        frameYSlider.value = Float(frame.origin.y)

        boundXSlider.maximumValue = Float(bounds.size.width)
        boundYSlider.maximumValue = Float(bounds.size.height)
        boundXSlider.value = Float(bounds.origin.x)
        boundYSlider.value = Float(bounds.origin.y)
        
        frameHeight.maximumValue = Float(superFrame.size.height)
        frameWidth.maximumValue = Float(superFrame.size.width)
        frameHeight.value = Float(frame.height)
        frameWidth.value = Float(frame.width)
        
        boundHeight.maximumValue = Float(bounds.size.height)
        boundWidth.maximumValue = Float(bounds.size.width)
        boundHeight.value = Float(bounds.height)
        boundWidth.value = Float(bounds.width)
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
    
    @IBAction func frameHeightChanged(_ sender: UISlider) {
        imageView.frame = CGRect(x: imageView.frame.origin.x, y: imageView.frame.origin.y, width: imageView.frame.width, height: CGFloat(sender.value))
        updateLabels()
    }
    
    @IBAction func frameWidthChanged(_ sender: UISlider) {
        imageView.frame = CGRect(x: imageView.frame.origin.x, y: imageView.frame.origin.y, width: CGFloat(sender.value), height: imageView.frame.height)
        updateLabels()
    }
    
    @IBAction func boundsHeightChanged(_ sender: UISlider) {
        imageView.bounds = CGRect(x: imageView.bounds.origin.x, y: imageView.bounds.origin.y, width: imageView.bounds.width, height: CGFloat(sender.value))
        updateLabels()
    }
    
    @IBAction func boundsWidthChanged(_ sender: UISlider) {
        imageView.bounds = CGRect(x: imageView.bounds.origin.x, y: imageView.bounds.origin.y, width: CGFloat(sender.value), height: imageView.bounds.height)
        updateLabels()
    }
    
    
    
    
}
