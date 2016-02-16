//
//  ViewController.swift
//  HollywoodSimilarities
//
//  Created by Andrew McKinley on 2/11/16.
//  Copyright © 2016 Andrew McKinley. All rights reserved.
//

import UIKit


class HSMainPage: UIViewController, UITextFieldDelegate {
    

    let firstEntry:UITextField = UITextField.init(frame: CGRectMake(10, 70, 200, 50))
    let secondEntry:UITextField = UITextField.init(frame: CGRectMake(10, 170, 200, 50))
    
    let compareButton:UIButton = UIButton(type: UIButtonType.System) as UIButton
    var firstSelection:UInt?
    var secondSelection:UInt?
    var firstCast:[Actor]?
    var secondCast:[Actor]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstEntry.delegate = self
        self.firstEntry.userInteractionEnabled = true
        self.firstEntry.placeholder = Config.MainVCConstants.firstPlaceholderText
        self.firstEntry.tag = 1 
        self.view.addSubview(self.firstEntry)
        
        self.secondEntry.delegate = self
        self.secondEntry.userInteractionEnabled = true
        self.secondEntry.placeholder = Config.MainVCConstants.secondPlaceholderText
        self.secondEntry.tag = 2
        self.view.addSubview(self.secondEntry)
        
        let text:String = Config.MainVCConstants.buttonTitle
        self.compareButton.setTitle(text, forState: .Normal)
        self.compareButton.frame = CGRectMake(10, 270, 100, 50)
        self.compareButton.addTarget(self, action: "compareResults", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.compareButton)
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = Config.MainVCConstants.titleBarText

    }
    
    internal func textFieldDidEndEditing(textField: UITextField){
        if let _movieName:String = textField.text{
            MovieRetrievalService.getMovieWithName(_movieName) { (_matchingMovies:[Movie]) -> Void in
                if _matchingMovies.count == 1 {
                    if let firstMovie:Movie = _matchingMovies.first{
                        self.setMovie(firstMovie, forResult: UInt(textField.tag))
                    }
                    
                } else if _matchingMovies.count >= 2 && _matchingMovies.count < 5{
                    
                    let alert = UIAlertController(title: Config.MainVCConstants.confusedTitle, message: Config.MainVCConstants.confusedDetail, preferredStyle: UIAlertControllerStyle.Alert)
                    var index = 1
                    for _eachResult:Movie in _matchingMovies{
                        let titleAndYear:String = "\(_eachResult.title) \(_eachResult.release_date)"
                        let action = UIAlertAction(title: titleAndYear, style: .Default, handler: { (_alertAction) -> Void in
                            self.setMovie(_eachResult, forResult: UInt(textField.tag))
                            textField.text = _eachResult.title
                        })
                        alert.addAction(action)
                        index++
                    }
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: Config.MainVCConstants.tooManyTitle, message: Config.MainVCConstants.tooManyDetail, preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction.init(title: "ok", style: .Destructive, handler: nil))

                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func setMovie(_movie:Movie, forResult:UInt){
        if forResult == 1 {
            self.firstSelection = UInt(_movie.id)
            MovieRetrievalService.getCastOfMovie(withId: UInt(_movie.id), _completion: { (_cast:[Actor]) -> Void in
                self.firstCast = _cast
            })
            self
        } else if forResult == 2 {
            self.secondSelection = UInt(_movie.id)
            MovieRetrievalService.getCastOfMovie(withId: UInt(_movie.id), _completion: { (_cast:[Actor]) -> Void in
                self.secondCast = _cast
            })
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    func compareResults(){
        if self.firstSelection != self.secondSelection{
            var similarCast:[Actor] = [Actor]()
            if let _firstCast:[Actor] = self.firstCast{
                if let _secondCast:[Actor] = self.secondCast{
                    for actorFromFirst in _firstCast {
                        for actorFromSecond in _secondCast{
                            if actorFromFirst.name == actorFromSecond.name{
                                similarCast.append(actorFromFirst)
                            }
                        }
                    }
                }
            }
            let listVC:HSResultsVC = HSResultsVC.init(_similarCast: similarCast)
            self.navigationController?.pushViewController(listVC, animated: true)
            return
            
        }
        
        let alert = UIAlertController(title: Config.MainVCConstants.insufficentMoviesTitle, message:nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction.init(title: "ok", style: .Destructive, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}

