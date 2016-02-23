//
//  ViewController.swift
//  RGBGuesser
//
//  Created by block7 on 9/30/15.
//  Copyright © 2015 block7. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var score = 0
    var round = 1
    var level = 1
    var progress: Float = 0
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var showButton: UIButton!
    
    @IBOutlet weak var viewone: UIView!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var levelSelect: UIButton!
    
    @IBOutlet weak var levelSegmentedControl: UISegmentedControl!
    
    var red: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var green: CGFloat = 0.0
    
    var redStart: CGFloat = 0.5
    var greenStart: CGFloat = 0.5
    var blueStart: CGFloat = 0.5
    
    var randomRed: UInt32 = 0
    var randomGreen: UInt32 = 0
    var randomBlue: UInt32 = 0
    
    var redScore = 0
    var greenScore = 0
    var blueScore = 0
    
    var sliderValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.enabled = false
        showButton.enabled = true
        viewone.backgroundColor = UIColor.whiteColor()
        setScoreandRound()
        resetBackgroundColor()
        progressStart()
        progressBar.hidden = false
        levelSegmentedControl.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showResult(){
        redScore = abs(Int(randomRed) - Int(red*255))
        greenScore = abs(Int(randomGreen) - Int(green*255))
        blueScore = abs(Int(randomBlue) - Int(blue*255))
        
        var points = redScore + blueScore + greenScore
        points = Int(Double(points)/7.65)
        points = 100 - points
        
        score += points
        
        let message = "You scored \(points) points out of 100"
        let title = "RGB"
        
        let alert = UIAlertController(title: title, message: message , preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: {
            nil
        }())
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)

        startnewRound()
        setScoreandRound()
        button.enabled = false
        showButton.enabled = true

    }
    @IBAction func setBackgroundColor(){
        randomRed = arc4random_uniform(256)
        randomGreen = arc4random_uniform(256)
        randomBlue = arc4random_uniform(256)
        
        redStart = CGFloat(randomRed)/255
        greenStart = CGFloat(randomGreen)/255
        blueStart = CGFloat(randomBlue)/255
        let opacity: CGFloat = 1
        
        if level == 1{
            progressBar.hidden = false
            if let wnd = self.view{
                
                let v = UIView(frame: wnd.bounds)
                v.backgroundColor = UIColor(red: redStart, green: greenStart, blue: blueStart, alpha: opacity)
                
                v.alpha = 1
                
                wnd.addSubview(v)
                UIView.animateWithDuration(4, animations: {
                    v.alpha = 0.5
                    }, completion: {(finished:Bool) in
                        v.removeFromSuperview()
                })
            }
        }
        else if level == 2{
            progressBar.hidden = false
            if let wnd = self.view{
                
                let v = UIView(frame: wnd.bounds)
                v.backgroundColor = UIColor(red: redStart, green: greenStart, blue: blueStart, alpha: opacity)
                
                v.alpha = 1
                
                wnd.addSubview(v)
                UIView.animateWithDuration(3, animations: {
                    v.alpha = 0.5
                    }, completion: {(finished:Bool) in
                        v.removeFromSuperview()
                })
            }
        }
        else if level == 3{
            progressBar.hidden = true
            if let wnd = self.view{
                
                let v = UIView(frame: wnd.bounds)
                v.backgroundColor = UIColor(red: redStart, green: greenStart, blue: blueStart, alpha: opacity)
                
                v.alpha = 1
                
                wnd.addSubview(v)
                UIView.animateWithDuration(3, animations: {
                    v.alpha = 0.0
                    }, completion: {(finished:Bool) in
                        v.removeFromSuperview()
                })
            }
        }
        else if level == 4{
            progressBar.hidden = true
            if let wnd = self.view{
                
                let v = UIView(frame: wnd.bounds)
                v.backgroundColor = UIColor(red: redStart, green: greenStart, blue: blueStart, alpha: opacity)
                
                v.alpha = 1
                
                wnd.addSubview(v)
                UIView.animateWithDuration(2, animations: {
                    v.alpha = 0.0
                    }, completion: {(finished:Bool) in
                        v.removeFromSuperview()
                })
            }
        }
        else if level > 4{
            progressBar.hidden = true
            if let wnd = self.view{
                
                let v = UIView(frame: wnd.bounds)
                v.backgroundColor = UIColor(red: redStart, green: greenStart, blue: blueStart, alpha: opacity)
                
                v.alpha = 1
                
                wnd.addSubview(v)
                UIView.animateWithDuration(1, animations: {
                    v.alpha = 0.0
                    }, completion: {(finished:Bool) in
                        v.removeFromSuperview()
                })
            }
            
        }
        showButton.enabled = false
        startround()
    }
    func updateBackgroundColor(){
        let opacity: CGFloat = 1
        self.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: opacity)
        progressUpdate()
        viewone.backgroundColor = UIColor.whiteColor()
    }
    @IBAction func redsliderMoved(redSlider: UISlider){
        red = CGFloat(redSlider.value)
        blue = CGFloat(blueSlider.value)
        green = CGFloat(greenSlider.value)
        updateBackgroundColor()
    }
    @IBAction func greensliderMoved(greenSlider: UISlider){
        red = CGFloat(redSlider.value)
        blue = CGFloat(blueSlider.value)
        green = CGFloat(greenSlider.value)
        updateBackgroundColor()

    }
    @IBAction func bluesliderMoved(blueSlider: UISlider){
        red = CGFloat(redSlider.value)
        blue = CGFloat(blueSlider.value)
        green = CGFloat(greenSlider.value)
        updateBackgroundColor()

    }
    func resetBackgroundColor(){
        self.view.backgroundColor = UIColor.whiteColor()
        viewone.backgroundColor = UIColor.whiteColor()
        
        
    }
    func startround(){
        sliderValue = 0
        redSlider.value = 0
        blueSlider.value = 0
        greenSlider.value = 0
        resetBackgroundColor()
        button.enabled = true
    }
    func startnewRound(){
        round += 1
        if round <= 2 {
            level = 1
        } else if round < 5{
            level = 2
        } else if round < 8{
            level = 3
        } else if round < 11{
            level = 4
        } else{
            level = 5
        }
        sliderValue = 0
        redSlider.value = 0
        blueSlider.value = 0
        greenSlider.value = 0
        resetBackgroundColor()
        progressStart()
        button.enabled = true
        
    }
    func setScoreandRound(){
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        levelLabel.text = String(level)
    }
    @IBAction func startOver(){
        score = 0
        round = 0
        level = 1
        startnewRound()
        progressStart()
        setScoreandRound()
        button.enabled = false
        showButton.enabled = true
        progressBar.hidden = false
    }
    
    func progressUpdate(){
        let absRed = abs(Float(redStart) - Float(red))
        let absGreen = abs(Float(greenStart) - Float(green))
        let absBlue = abs(Float(blueStart) - Float(blue))
        progress = absRed + absBlue + absGreen
        progress = progress/3
        let p = 1-progress
        progressBar?.setProgress(p, animated: true)
    }
    func progressStart(){
        progress = 0
        let p = progress
        progressBar?.setProgress(p, animated: true)
        
    }
    @IBAction func selectLevelClicked(){
        levelSegmentedControl.hidden = false
    }
    @IBAction func levelChanged(sender:UISegmentedControl){
        switch levelSegmentedControl.selectedSegmentIndex{
        case 0:
            level = 1
            round = 0
            startnewRound()
            setScoreandRound()
            button.enabled = false
            levelSegmentedControl.hidden = true
        case 1:
            level = 2
            round = 2
            startnewRound()
            setScoreandRound()
            button.enabled = false
            levelSegmentedControl.hidden = true
        case 2:
            level = 3
            round = 4
            startnewRound()
            setScoreandRound()
            button.enabled = false
            levelSegmentedControl.hidden = true
        case 3:
            level = 4
            round = 7
            startnewRound()
            setScoreandRound()
            button.enabled = false
            levelSegmentedControl.hidden = true
        case 4:
            level = 5
            round = 10
            startnewRound()
            setScoreandRound()
            button.enabled = false
            levelSegmentedControl.hidden = true
        default:
            break
        }
    }

}

