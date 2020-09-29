//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 瀧本達也 on 2020/09/29.
//  Copyright © 2020 瀧本達也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var Playbutton: UIButton!
    
   
  
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // 配列に指定するindex番号を宣言
       var nowIndex:Int = 0
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    // スライドショーさせる画像の配列を宣言
       var imageArray:[UIImage] = [
           UIImage(named: "image1")!,
           UIImage(named: "image2")!,
           UIImage(named: "image3")!,
    
  ]
    
  //  var selectedImage: UIImage!
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
    print("segue")
        
        if (segue.identifier == "ViewController2"){
            
            let subVC:ViewController2 = (segue.destination as? ViewController2)!
            
            ImageView.image = imageArray[nowIndex]
            subVC.selectedImg = ImageView.image
        }
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       
        // Do any additional setup after loading the view.
    }

    
    @IBAction func PlayButton(_ sender: Any) {
        
        if timer == nil{
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            //ボタンの名前を変える
            Playbutton.setTitle("停止", for: .normal)
            
            nextButton.isEnabled = false
            backButton.isEnabled = false
            
        }else{
            timer.invalidate()
            timer = nil
            
            Playbutton.setTitle("再生", for: .normal)
            
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
            
            
        }
        
      

        
        }

    
    @objc func changeImage(){
        
        nowIndex += 1
        
        if (nowIndex == imageArray.count){
         nowIndex = 0
        }
        
        ImageView.image = imageArray[nowIndex]
        
        
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        nowIndex -= 1
        
       
        
        if (nowIndex < 0) {
            nowIndex = 2
        }
        
        ImageView.image = imageArray[nowIndex]
        
    }

    @IBAction func NextButton(_ sender: Any) {
        
        changeImage()
        print("ok")
        
    }
    
   
  
    @IBAction func ImageTap(_ sender: Any) {
        print("tapped")
        
    }
    
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
      }
    
    
  
    
}

