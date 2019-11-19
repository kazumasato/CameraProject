//
//  ViewController.swift
//  CameraProject
//
//  Created by 佐藤一馬 on 2019/11/19.
//  Copyright © 2019年 佐藤一馬. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    //カメラの起動ボタン
    @IBAction func runCamera(_ sender: UIButton) {
        //ユーザーがカメラの使用を許可したかチェック
        //許可している場合、カメラの画面を作成
        //カメラ画面を表示
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            //カメラが許可されている場合
            print("カメラは許可されている")
            
            //カメラの画面を作成
            //UIImagePickerController: カメラもしくはアルバムの画面を担当
            let cameraview = UIImagePickerController()
            cameraview.sourceType = .camera
            cameraview.delegate = self
            //カメラ画面を表示
            present(cameraview, animated: true, completion: nil)
            
        }else{
            //カメラが許可されていない場合
            print("カメラは許可されていない")
        }
    }
    //アルバムボタン
    @IBAction func runAlbum(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            //アルバムの仕様が許可されている場合
            
            //アルバムの画面をさくせい
            let albumview = UIImagePickerController()
            albumview.sourceType = .photoLibrary
            albumview.delegate = self
            
            present(albumview, animated: true, completion: nil)
        }
    }
    //保存ボタン
    @IBAction func savePhoto(_ sender: UIButton) {
        
        //画面に表示されている画像を取得
        let displayimage = imageView.image
        
        //画像が空(nil)で無い場合
        //画像をアルバムに保存する
        if displayimage != nil {
            //画像が空(nil)で無い場
            
            UIImageWriteToSavedPhotosAlbum(displayimage!, self, nil, nil)
        }
    }
    
    //didFinishPiまで打ち込んで予測変換
    //写真撮影　or アルバムでの写真選択が完了した時に実行される
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //写真が存在する場合、
        //その写真を画面に表示する
        //表示されているカメラ or アルバムの画面を閉じる
        
        if let pickedImage = info[.originalImage] as? UIImage {
            //写真が存在する場合、変数pickedImageにその写真が渡される
            
            //その写真を画面に表示する
            imageView.image = pickedImage
        }
        
        //picker:カメラorアルバム画面
        //dismiss:画面を閉じる
        picker.dismiss(animated: true, completion: nil)
        
        
    }
    
}

