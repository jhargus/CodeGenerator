//
//  CodeHelper.swift
//  CodeGenerator
//
//  Created by Jacob M Hargus on 1/7/16.
//  Copyright © 2016 Jacob M Hargus. All rights reserved.
//

import Foundation
import Cocoa

public class CodeHelper {
    
    // Mark Generate QR Code
    public class func generateQRCode(codeValue: String!) -> NSImage? {

        let data = codeValue.dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
        
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter!.setValue(data, forKey: "inputMessage")
        filter!.setValue("Q", forKey: "inputCorrectionLevel")
        
        if let codeImage = filter!.outputImage {
            if let result = CodeHelper.convertCIImageToNSImage(codeImage) {
                return result
            }
        }
        
        
        return nil
        
    }
    
    // Mark Generate Bar Code
    public class func generateBarCode(codeValue: String!) -> NSImage? {
        
        let data = codeValue.dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
        
        let filter = CIFilter(name: "CICode128BarcodeGenerator")
        
        filter!.setValue(data, forKey: "inputMessage")
        //filter.setValue("Q", forKey: "inputCorrectionLevel")
        
        if let codeImage = filter!.outputImage {
            if let result = CodeHelper.convertCIImageToNSImage(codeImage) {
                return result
            }
        }
        
        
        
        return nil
    }
    
    public class func generateAztecCode(codeValue: String!) -> NSImage? {
        

        let data = codeValue.dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
        
        let filter = CIFilter(name: "CIAztecCodeGenerator")
        
        filter!.setValue(data, forKey: "inputMessage")
        filter!.setValue(1.0, forKey: "inputCompactStyle")
        filter!.setValue(75, forKey: "inputCorrectionLevel")
        
        if let codeImage = filter!.outputImage{
            if let result = CodeHelper.convertCIImageToNSImage(codeImage) {
                return result
            }
        }
        
        
        return nil
        
    }
    
    public class func convertCIImageToNSImage(codeImage: CIImage) -> NSImage? {
        let rep = NSCIImageRep(CIImage: codeImage)
        let nsi = NSImage(size: rep.size)
        
        nsi.addRepresentation(rep)
        
        return nsi
    }
}