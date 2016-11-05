//
//  ViewController.swift
//  KeyCards
//
//  Created by Dragos Florin on 10/26/16.
//  Copyright © 2016 Dragos Florin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabeView: UITableView!
    
    var carduri : [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tabeView.dataSource = self
        tabeView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            carduri = try context.fetch(Card.fetchRequest())
            tabeView.reloadData()
        }catch{}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell()
        let card = carduri[indexPath.row]
        celula.textLabel?.text = card.numeCard
        celula.imageView?.image = UIImage(data: card.imagineCard as! Data)
        return celula
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carduri.count
    }

}

