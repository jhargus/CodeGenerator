//
//  ViewController.swift
//  CodeGenerator
//
//  Created by Jacob M Hargus on 1/7/16.
//  Copyright © 2016 Jacob M Hargus. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var imgBCImage: NSImageView!
    @IBOutlet var txtValue: NSTextField!
    @IBOutlet var segType: NSSegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func generateCode(sender: AnyObject) {
        
        var currentImage : NSImage? = nil
        let valueText : String? = self.txtValue?.stringValue
        
        switch segType.selectedSegment {
            
            case 0:
                currentImage = CodeHelper.generateQRCode(valueText)
            case 1:
                currentImage = CodeHelper.generateBarCode(valueText)
            case 2:
                currentImage = CodeHelper.generateAztecCode(valueText)
            
            default:
                currentImage = CodeHelper.generateQRCode(valueText)
            
        }
        
        if currentImage != nil {
            self.imgBCImage.image = currentImage
        }
        
    }

}

