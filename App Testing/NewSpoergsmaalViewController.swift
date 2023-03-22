//
//  NewSpoergsmaalViewController.swift
//  App Testing
//
//  Created by mediastyle on 21/03/2023.
//


import UIKit

class NewSpoergsmaalViewController: UIViewController{
   
    
    @IBOutlet weak var SpoergsmaalLabel: UILabel!
    @IBOutlet weak var SpoergsmaalSubLabel: UILabel!
    
    @IBOutlet weak var SpoergsmaalSubLabelIcon: UIImageView!
    
    //@IBOutlet weak var mainStackView: UICollectionView!
    
    @IBOutlet weak var stackView: UIStackView!
    //@IBOutlet weak var SvarButton: UIButton!
    
    var QuestionsArray = [Spoergsmaal]()
    var AnswersArray = [Svar]()
    var objectsArray = [String]()
    let cellIdentifier = "cell"
    
    //@IBAction func SvarButtonClicked(_ sender: Any) {
      //  SpoergsmaalLabel.text = String(QuestionsArray[1].spoergsmaal_tekst!)

    //}
    
    //MARK: View Making methods
    /*func makeButtonWithAnswer(text:String) -> UIButton {
        let answerButton = UIButton(type: UIButton.ButtonType.system)
        //answerButton.frame = CGRect(x: 0, y: 0, width: 4, height: 4)
        answerButton.backgroundColor = UIColor.white
        answerButton.configuration = .plain()
        answerButton.layer.cornerRadius = 15
        answerButton.layer.borderWidth = 4
        answerButton.layer.borderColor = UIColor.systemGray5.cgColor
        //State dependent properties title and title color
        answerButton.setTitle(text, for: .normal)
        answerButton.setTitleColor(.black, for: .normal)
        return answerButton
    }*/
    
    func displayAnswerButtons(){
        for i in stride(from: 0, to: AnswersArray.count, by: 1){
            let titleString = String(AnswersArray[i].svar_tekst!)
            //let button = makeButtonWithAnswer(text:titleString)
            
            self.objectsArray.append(titleString)
        }
            
            let items: [[String]] = [
                objectsArray
            ]
            let controller = CollectionViewController(items: items)
            controller.view.translatesAutoresizingMaskIntoConstraints = false
            stackView?.addArrangedSubview(controller.view)
            addChild(controller)
    }
    
   /* func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.objectsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CellWithButton
        cell.titleLabel.text = objectsArray[indexPath.row].title
        return cell
    }*/
    
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
        }
        
        NetworkServiceAnswers.sharedObj.getAnswers { (Answers) in
            self.AnswersArray = Answers
            self.displayAnswerButtons()
        }

    }
        
    }
