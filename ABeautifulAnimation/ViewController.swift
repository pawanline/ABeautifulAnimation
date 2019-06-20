//
//  ViewController.swift
//  ABeautifulAnimation
//
//  Created by Pawan Kumar on 20/06/19.
//  Copyright © 2019 PawanShivHari inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var busImageView: UIImageView!
    @IBOutlet var carImageView: UIImageView!

    var multiple = 1
    var animator: UIDynamicAnimator?
    let gravity = UIGravityBehavior()
    let carGravity = UIGravityBehavior()

    override func viewDidLoad() {
        super.viewDidLoad()

        busImageView.layer.zPosition = -10

        createAnimatorStuff()
    }

    @objc func startAnimation() {
        createAnimatorStuff()
    }

    func createAnimatorStuff() {
        animator = UIDynamicAnimator(referenceView: view)

        // gravity.addItem(busImageView);
        carGravity.addItem(carImageView)
        gravity.gravityDirection = CGVector(dx: -Double(multiple) * 0.8, dy: 0)
        gravity.setAngle(CGFloat(multiple) * CGFloat.pi, magnitude: 1)
        carGravity.gravityDirection = CGVector(dx: Double(multiple) * 0.8, dy: 0)
        animator?.addBehavior(gravity)
        animator?.addBehavior(carGravity)

        if animator?.isRunning ?? false {
            multiple *= -1
            perform(#selector(startAnimation), with: self, afterDelay: 1.0)
        }
    }
}
