//
//  MatchHome.swift
//  CricketMedia
//
//  Created by Abhay Singh on 27/05/23.
//

import UIKit

class MatchHome: UIViewController {

    @IBOutlet weak var myTableView2: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var matchdetails: Welcome?
}

extension MatchHome: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            guard let teamHome = matchdetails?.matchdetail.teamHome, let teamHomeName = matchdetails?.teams[teamHome]?.nameFull else {
                return "Home Team"
            }
            return teamHomeName
        }
        guard let teamAway = matchdetails?.matchdetail.teamAway, let teamAwayName = matchdetails?.teams[teamAway]?.nameFull else {
            return "Away Team"
        }
        return teamAwayName
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = myTableView2.dequeueReusableCell(withIdentifier: "matchdetail", for: indexPath) as! MyTableViewCell2
        guard let teamHome = matchdetails?.matchdetail.teamHome,let teamAway = matchdetails?.matchdetail.teamAway  else {
            return cell2
        }
        
        if indexPath.section == 0 {
            guard let playersName = matchdetails?.teams[teamHome]?.players else {
                return cell2
            }
            let keys = Array(playersName.keys)
            guard let playerName = playersName[keys[indexPath.row]]?.nameFull else {
                return cell2
            }
            
            cell2.playername.text = playerName
            cell2.backgroundColor = .orange
            cell2.playername.font = .systemFont(ofSize: 18)
            cell2.captainOrWk.font = .boldSystemFont(ofSize: 24)
            //Git check

            if let isCaptain = playersName[keys[indexPath.row]]?.iscaptain, let isKeeper = playersName[keys[indexPath.row]]?.iskeeper, isCaptain && isKeeper  {
                cell2.captainOrWk.text = "C/WK"
            } else if let onlyCaptain = playersName[keys[indexPath.row]]?.iscaptain, onlyCaptain {
                cell2.captainOrWk.text = "C"
            } else if let onlyKeeper = playersName[keys[indexPath.row]]?.iskeeper, onlyKeeper {
                cell2.captainOrWk.text = "WK"
            } else {
                cell2.captainOrWk.text = ""
            }

        } else {
            guard let playersName = matchdetails?.teams[teamAway]?.players else {
                return cell2
            }
            let keys = Array(playersName.keys)
            guard let playerName = playersName[keys[indexPath.row]]?.nameFull else {
                return cell2
            }
            cell2.playername.text = playerName
            cell2.backgroundColor = .lightGray
            cell2.playername.font = .systemFont(ofSize: 18)
            cell2.captainOrWk.font = .boldSystemFont(ofSize: 25)

            if let isCaptain = playersName[keys[indexPath.row]]?.iscaptain, let isKeeper = playersName[keys[indexPath.row]]?.iskeeper, isCaptain && isKeeper  {
                cell2.captainOrWk.text = "C/WK"
            } else if let onlyCaptain = playersName[keys[indexPath.row]]?.iscaptain, onlyCaptain {
                cell2.captainOrWk.text = "C"
            } else if let onlyKeeper = playersName[keys[indexPath.row]]?.iskeeper, onlyKeeper {
                cell2.captainOrWk.text = "WK"
            } else {
                cell2.captainOrWk.text = ""
            }
        }
        cell2.layer.borderColor = UIColor.black.cgColor
        cell2.layer.borderWidth = 1
        
        return cell2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let teamHome = matchdetails?.matchdetail.teamHome,let teamAway = matchdetails?.matchdetail.teamAway  else {
            return
        }
        if indexPath.section == 0 {
            guard let playersName = matchdetails?.teams[teamHome]?.players else {
                return
            }
            
            let keys = Array(playersName.keys)
            
            guard let playerName = playersName[keys[indexPath.row]]?.nameFull else {
                return
            }
            
            guard let battingStyle = playersName[keys[indexPath.row]]?.batting.style else {
                return
            }
            
            guard let bowlingStyle = playersName[keys[indexPath.row]]?.bowling.style else {
                return
            }
            
            let alert = UIAlertController(title: playerName, message: "Batting Style: \(battingStyle)\nBowling Style: \(bowlingStyle)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        } else {
            guard let playersName = matchdetails?.teams[teamAway]?.players else {
                return
            }
            
            let keys = Array(playersName.keys)
            
            guard let playerName = playersName[keys[indexPath.row]]?.nameFull else {
                return
            }
            
            guard let battingStyle = playersName[keys[indexPath.row]]?.batting.style else {
                return
            }
            
            guard let bowlingStyle = playersName[keys[indexPath.row]]?.bowling.style else {
                return
            }
            
            let alert = UIAlertController(title: playerName, message: "Batting Style: \(battingStyle)\nBowling Style: \(bowlingStyle)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
    
       
    }
    
}
