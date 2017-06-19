//
//  DrawingVC.swift
//  Bangla Alphabet
//
//  Created by Md AfzaL Hossain on 3/26/17.
//  Copyright © 2017 Md AfzaL Hossain. All rights reserved.
//

import UIKit

class DrawingVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    var currentPoint = CGPoint.zero
    var lastPoint = CGPoint.zero
    var swiped = false
    
    var red: CGFloat = 1.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    var isDrawing = true
    
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    func drawLines(fromPoint: CGPoint,toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setStrokeColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        context?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            currentPoint = touch.location(in: self.view)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
        }
    }
    
    @IBAction func resetDrawing(_ sender: Any) {
        imgView.image = nil
    }
    
    @IBAction func ereser(_ sender: Any) {
            (red,green,blue) = (54/255,128/255,65/255)
    }
    @IBAction func save(_ sender: Any) {
        
        let alert = UIAlertController(title: "Pick your option", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Pick an image", style: .default, handler: { (_) in
            let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = false
                imagePicker.delegate = self
            
                self.present(imagePicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Save your drawing", style: .default, handler: { (_) in
            if let image = self.imgView.image {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
 
    }
    
    @IBAction func setting(_ sender: Any) {
        
    }
    
    @IBAction func colorPicked(btn: UIButton) {
        if btn.tag == 1 {
            (red,green,blue) = (1,0,0)
        }else if btn.tag == 2 {
            (red,green,blue) = (0,1,0)
        }else if btn.tag == 3 {
            (red,green,blue) = (0,0,1)
        }else if btn.tag == 4 {
            (red,green,blue) = (1,0,1)
        }else if btn.tag == 5 {
            (red,green,blue) = (1,1,0)
        }else if btn.tag == 6 {
            (red,green,blue) = (0,1,1)
        }else if btn.tag == 7 {
            (red,green,blue) = (1,1,1)
        }else if btn.tag == 8 {
            (red,green,blue) = (0,0,0)
        }else {
           (red,green,blue) = (1,0,0) 
        }
  
    }

}
extension DrawingVC: UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imagePicked = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.selectedImage = imagePicked
            self.imgView.image = selectedImage
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
