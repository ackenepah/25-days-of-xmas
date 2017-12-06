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
    
    var requests = [VNRequest]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVision()
    }
    
    func setupVision() {
        guard let visionModel = try? VNCoreMLModel(for: MNIST().model) else { fatalError("Cannot load Vision ML Model.") }
        let classificationRequest = VNCoreMLRequest(model: visionModel, completionHandler: self.handleClassification)
        self.requests = [classificationRequest]
    }
    
    func handleClassification(request: VNRequest, error: Error?) {
        guard let observations = request.results else { fatalError("There are no results."); return }
        
        let classification = observations
            .flatMap({ $0 as? VNClassificationObservation })
            .filter({ $0.confidence > 0.8 })
            .map({ $0.identifier })
        
        DispatchQueue.main.async {
            self.digitLabel.text = classification.first
        }
    }
    
    @IBAction func clearCanvas(_ sender: UIButton) {
        canvasView.clearCanvas()
    }
    
    @IBAction func recognizeDigit(_ sender: UIButton) {
        let image = UIImage(view: canvasView)
        let scaledImage = scaleImage(image: image, toSize: CGSize(width: 28, height: 28))
        
        let imageRequestHandler = VNImageRequestHandler(cgImage: scaledImage.cgImage!, options: [:])
        
        do {
            try imageRequestHandler.perform(self.requests)
        } catch {
            print(error)
        }
    }
    
    func scaleImage (image: UIImage, toSize size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

