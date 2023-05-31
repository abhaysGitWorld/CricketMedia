//
//  ViewController.swift
//  CricketMedia
//
//  Created by Abhay Singh on 26/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    var matchdetail: Welcome?
        
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    func fetchData() {
        let url = URL(string: "https://demo.sportz.io/sapk01222019186652.json")
        
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else  {
                print("Error occured while accessing Data with URL")
                return
            }
            
            var cricketData: Welcome?
            
            do {
                cricketData = try JSONDecoder().decode(Welcome.self, from: data)
            }
            catch {
                print("Error occured while decoding JSON into Swift Structure \(error)")
                
            }
            
            self.matchdetail = cricketData!
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        })
        dataTask.resume()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        guard let teamHome = matchdetail?.matchdetail.teamHome,let teamAway = matchdetail?.matchdetail.teamAway, let teamHomeName = matchdetail?.teams[teamHome]?.nameFull, let teamAwayName = matchdetail?.teams[teamAway]?.nameFull else {
            return cell
        }
        cell.matchName.text = "\(teamHomeName) vs \(teamAwayName)"
        cell.time.text = "Time: \(matchdetail?.matchdetail.match.time ?? "")"
        cell.date.text = "Date: \(matchdetail?.matchdetail.match.date ?? "")"
        cell.venue.text = "Venue: \(matchdetail?.matchdetail.venue.name ?? "")"
        
        cell.matchName.font = .boldSystemFont(ofSize: 30)
        cell.time.font = .systemFont(ofSize: 18)
        cell.date.font = .systemFont(ofSize: 18)
        cell.venue.font = .systemFont(ofSize: 18)

        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.backgroundColor = .systemPink
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "matchhome") as? MatchHome
        vc?.matchdetails = matchdetail
        navigationController?.pushViewController(vc!, animated: true)
    }
    
}

