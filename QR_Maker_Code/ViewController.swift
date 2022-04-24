//
//  ViewController.swift
//  QR_Maker_Code
//
//  Created by Yasser Hajlaoui on 4/23/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt_Link: UITextField!
    @IBOutlet weak var img_QR_ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btn_Generate(_ sender: Any) {
        
        if let linkText = txt_Link.text {
            let myImage = generateQRCode(from: linkText)
            img_QR_ImageView.image = myImage
        }
        
    }
    
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 6, y: 6)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

    
    
    
}

