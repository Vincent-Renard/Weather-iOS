//
//  ViewController.swift
//  API
//
//  Created by Ali ED-DBALI on 11/03/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var villeLabel: UILabel!
    var urlAPI = "http://api.openweathermap.org/data/2.5/weather?appid={key]&units=metric&q=Paris"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: urlAPI)
        
        let session = URLSession(configuration: .default)
        let tache = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!)
            } else {
                if let data = data {
                    // let dataString = String(data: data, encoding: .utf8)
                    // print(dataString!)
                    let dataDecode = JSONDecoder()
                    do {
                        let donnee = try dataDecode.decode(Donnee.self, from: data)
                        print(donnee.name)
                        print(donnee.main.temp)
                        DispatchQueue.main.async {
                            self.tempLabel.text = String(format: "%.1f", donnee.main.temp)
                            self.villeLabel.text = "Paris"
                            
                        }
                    } catch {
                        print(error)
                    }
                } else {
                    print("Pas de donnée")
                }
            }
        }
        tache.resume()
    }


}

