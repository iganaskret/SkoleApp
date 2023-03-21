//
//  NewSpoergsmaalViewController.swift
//  App Testing
//
//  Created by mediastyle on 21/03/2023.
//


import UIKit

class NewSpoergsmaalViewController: UIViewController{
   
    
    //var selectedInfo: TestInfo!
    @IBOutlet weak var SpoergsmaalLabel: UILabel!
    
    @IBOutlet weak var SvarButton: UIButton!
    
    var QuestionsArray = [Spoergsmaal]()
    
    @IBAction func SvarButtonClicked(_ sender: Any) {
        SpoergsmaalLabel.text = String(QuestionsArray[1].spoergsmaal_tekst!)

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkServiceQuestions.sharedObj.getQuestions { (Questions) in
            self.QuestionsArray = Questions
            self.SpoergsmaalLabel.text = String(self.QuestionsArray[0].spoergsmaal_tekst!)
        }
        
       
    }
    
    
    
    
        
    }
    
    
    // Selected?
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedInfo = InfoArray[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    // Delete?
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            self.InfoArray.remove(at: indexPath.row)
            self.infoTable.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Go to detail view (not made)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? InfoVC
        {
            destinationVC.info = selectedInfo
        }
    }*/
    
    






