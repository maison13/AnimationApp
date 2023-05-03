//
//  ViewController.swift
//  AnimationAppTwo
//
//  Created by Vovo on 03.05.2023.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    private var currentAnimation: Animation!
    private var nextAnimation: Animation!
    
    @IBOutlet weak var presetValueLabel: UILabel!
    @IBOutlet weak var curveValueLabel: UILabel!
    @IBOutlet weak var forceValueLabel: UILabel!
    @IBOutlet weak var durationValueLabel: UILabel!
    @IBOutlet weak var delayValueLabel: UILabel!
    
    @IBOutlet weak var springAnimationView: SpringView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextAnimation = Animation.getAnimation()
        updateTextLabel(from: nextAnimation)
    }
    
    private func updateTextLabel(from animation: Animation) {
        presetValueLabel.text = animation.preset
        curveValueLabel.text = animation.curve
        forceValueLabel.text = String(format: "%.2f", animation.force)
        durationValueLabel.text = String(format: "%.2f", animation.duration)
        delayValueLabel.text = String(format: "%.2f", animation.delay)
    }
    
    @IBAction func startButtonPressed(_ sender: SpringButton) {
        currentAnimation = nextAnimation
        
        nextAnimation = Animation.getAnimation()
        sender.setTitle("Next animation is \(nextAnimation.preset)", for: .normal)
        
        springAnimationView.animation = currentAnimation.preset
        springAnimationView.curve = currentAnimation.curve
        springAnimationView.force = CGFloat(currentAnimation.force)
        springAnimationView.duration = CGFloat(currentAnimation.duration)
        springAnimationView.delay = CGFloat(currentAnimation.delay)
        springAnimationView.animate()
        
        updateTextLabel(from: currentAnimation)

    }
}

