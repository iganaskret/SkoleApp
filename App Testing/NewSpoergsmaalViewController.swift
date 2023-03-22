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
    @IBOutlet weak var SpoergsmaalSubLabel: UILabel!
    
    @IBOutlet weak var SpoergsmaalSubLabelIcon: UIImageView!
    @IBOutlet weak var mainStackView: UIStackView!
    //@IBOutlet weak var SvarButton: UIButton!
    
    var QuestionsArray = [Spoergsmaal]()
    
    //@IBAction func SvarButtonClicked(_ sender: Any) {
      //  SpoergsmaalLabel.text = String(QuestionsArray[1].spoergsmaal_tekst!)

    //}
    
    //MARK: View Making methods
    func makeButtonWithAnswer(text:String) -> UIButton {
        let answerButton = UIButton(type: UIButton.ButtonType.system)
        answerButton.frame = CGRect(x: 30, y: 30, width: 50, height: 50)
        answerButton.backgroundColor = UIColor(white: 0.25, alpha: 1.0)
        //State dependent properties title and title color
        answerButton.setTitle(text, for: .normal)
        answerButton.setTitleColor(.white, for: .normal)
        return answerButton
    }
    
    func displayAnswerButtons(count:Int){
        for i in 0...count{
            let titleString = String(QuestionsArray[i].spoergsmaal_tekst!)
            //let titleString = String(format:"Hello Button %i",i)
            let button = makeButtonWithAnswer(text:titleString)
            mainStackView.addArrangedSubview(button)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkServiceQuestions.sharedObj.getQuestions { (Questions) in
            self.QuestionsArray = Questions
            self.SpoergsmaalLabel.text = String(self.QuestionsArray[0].spoergsmaal_tekst!)
            // if the max_antal_svar is greater than 1, display the message
            if(Int(self.QuestionsArray[0].max_antal_svar!) > 1){
                self.SpoergsmaalSubLabel.text = "Du kan vælge opå til " + String(self.QuestionsArray[0].max_antal_svar!) + " svar"
            } else {
                self.SpoergsmaalSubLabel.isHidden = true
                self.SpoergsmaalSubLabelIcon.isHidden = true
            }
            self.displayAnswerButtons(count: 1)
        }
        mainStackView.spacing = 1.0
        //mainStackView.addArrangedSubview(makeButtonWithAnswer(text:"Hello,Button"))
        //mainStackView.addArrangedSubview(makeButtonWithAnswer(text:"Hello,Button 2"))

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
    
    






