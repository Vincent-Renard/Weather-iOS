//
//  ViewController.swift
//  API
//
//  Created by Ali ED-DBALI on 11/03/2021.
//

import UIKit

class ViewController: UIViewController {

    let API_KEY = "69aed89aca86daccd97f609835c875f6"
    
    let units="metric"
    let lang = "fr"
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var villeLabel: UILabel!
    @IBOutlet weak var skyView: UIImageView!
    @IBOutlet weak var cityInput: UITextField!
    
    @IBAction func searchButton(_ sender: UIButton) {
        let urlFormat = "http://api.openweathermap.org/data/2.5/weather?appid=\(API_KEY)&units=\(units)&lang=\(lang)"
        var city = cityInput.text!
        city=city.trimmingCharacters(in: [" "])
        
        print("city : "+city)
 
        let url = URL(string:"\(urlFormat)&q=\(city)")
        
        self.performGet(url: url!)
    }
    
   
    @IBAction func weatherOnCurrentLoc(_ sender: UIButton) {
        
    }
    func performGet(url : URL) {
        
        let session = URLSession(configuration: .default)
        let tache = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
            } else {
                if let data = data {
                    let dataDecode = JSONDecoder()
                    do {
                        let donnee = try dataDecode.decode(Payload.self, from: data)
                        self.displayWeather(data: donnee)
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
    func displayWeather(data : Payload){
        print(data.name)
        print(data.main.temp)
        DispatchQueue.main.async {
            self.tempLabel.text = String(format: "%.1f", data.main.temp)
            self.villeLabel.text = data.name
            self.skyView.image=UIImage(named: data.weather[0].icon)
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }


}

