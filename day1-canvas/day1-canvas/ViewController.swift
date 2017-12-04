//
//  ViewController.swift
//  day1-canvas
//
//  Created by Adrian Kenepah-Martin on 12/3/17.
//  Copyright © 2017 Adrian Kenepah-Martin. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var digitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func clearCanvas(_ sender: UIButton) {
        canvasView.clearCanvas()
    }
    
    @IBAction func recognizeDigit(_ sender: UIButton) {
    }
}

