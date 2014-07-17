//
//  ViewController.swift
//  sampleSwift
//
//  Created by SivaSankar on 08/07/14.
//  Copyright (c) 2014 Paradim Creatives. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView:UIImageView = UIImageView()
    var imagesDict:Dictionary<String,String> = Dictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width:CGFloat = 320
        let height:CGFloat = 568
        
        imagesDict = ["image1":"image1","image2":"image2"]
        
        var buttonTitles = ["image1","image2"]
        
        var view:UIView = UIView(frame: CGRectMake(0, 0, width, height))
        self.view.addSubview(view)
        
        var ourImage:UIImage = UIImage(named:imagesDict["image1"])
        imageView = UIImageView(frame: view.frame)
        imageView.image = ourImage
        view.addSubview(imageView)
        
        for i in 0...buttonTitles.count-1{
            var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
            button.frame = CGRectMake(0, 0, 200, 20)
            button.center = CGPointMake(self.view.center.x, CGFloat(200+i*50))
            button.setTitle(buttonTitles[i], forState: UIControlState.Normal)
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            button.tag = i+1
            view.addSubview(button)
            
        }
        
        var navigateButton:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        navigateButton.frame = CGRectMake(250, 50, 70, 20)
        navigateButton.setTitle("Next", forState: UIControlState.Normal)
        navigateButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        navigateButton.addTarget(self, action: "moveToNextView:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(navigateButton)
    }
    
    // move to next view button clicked method.
    func moveToNextView(sender:UIButton){

        let loadDataView = self.storyboard.instantiateViewControllerWithIdentifier("loadDataController") as loadDataController

        self.presentViewController(loadDataView, animated: true, completion: nil)
    }
    
    // change image animation button clicked method.
    func buttonClicked(sender:UIButton){
        var button:UIButton = sender
        var selectedImageString:NSString = "image\(button.tag)"
        println("\(selectedImageString)")
        
        UIView.animateWithDuration(0.4, animations: {self.imageView.alpha = 0}, completion: {_ in self.imageView.image = UIImage(named:self.imagesDict[selectedImageString])
            UIView.animateWithDuration(0.4, animations: {self.imageView.alpha = 1})
            })
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

