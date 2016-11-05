//
//  CardViewController.swift
//  KeyCards
//
//  Created by Dragos Florin on 10/31/16.
//  Copyright © 2016 Dragos Florin. All rights reserved.
//

import UIKit

class CardViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var CampTextCard: UITextField!
    
    @IBOutlet weak var ImagineCard: UIImageView!
    
    var prindeImagine = UIImagePickerController ()

    override func viewDidLoad() {
        super.viewDidLoad()

        prindeImagine.delegate = self
    }

    @IBAction func PozeApasat(_ sender: AnyObject) {
        
        prindeImagine.sourceType = .photoLibrary
        
        present(prindeImagine, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imagine = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        ImagineCard.image = imagine
        
        prindeImagine.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func SalveazaApasat(_ sender: AnyObject) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let card = Card(context: context)
        card.numeCard = CampTextCard.text
        card.imagineCard = UIImagePNGRepresentation(ImagineCard.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
  
    
    @IBAction func CameraApasat(_ sender: AnyObject) {
        
    }

}
