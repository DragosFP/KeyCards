//
//  CardViewController.swift
//  KeyCards
//
//  Created by Dragos Florin on 10/31/16.
//  Copyright © 2016 Dragos Florin. All rights reserved.
//

import UIKit

class CardViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var butonSterge: UIButton!
    
    @IBOutlet weak var saveModificaButon: UIButton!
    
    @IBOutlet weak var CampTextCard: UITextField!
    
    @IBOutlet weak var ImagineCard: UIImageView!
    
    var prindeImagine = UIImagePickerController ()
    var card : Card? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        prindeImagine.delegate = self
        if card != nil {
            ImagineCard.image  = UIImage(data: card!.imagineCard as! Data)
            CampTextCard.text = card!.numeCard
            saveModificaButon.setTitle("Modifica", for: .normal)
              
        } else {
            butonSterge.isHidden = true
        }
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
        
        if card != nil {
            card!.numeCard = CampTextCard.text
            card!.imagineCard = UIImagePNGRepresentation(ImagineCard.image!) as NSData?
        } else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let card = Card(context: context)
            card.numeCard = CampTextCard.text
            card.imagineCard = UIImagePNGRepresentation(ImagineCard.image!) as NSData?
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
  
    
    @IBAction func CameraApasat(_ sender: AnyObject) {
        
    }

    @IBAction func butonSterge(_ sender: AnyObject) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(card!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
