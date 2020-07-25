//
//  ImageInfoVC.swift
//  ImageSliderMVP
//
//  Created by Ateek on 5/30/20.
//  Copyright © 2020 Ateek. All rights reserved.
//

import UIKit

class ImageSliderVC: UIViewController {
    @IBOutlet weak var sliderCollectionView:UICollectionView!
    @IBOutlet weak var closeBtn:UIButton!
    var selectedIndex = 0
   
    var presnter:PresenterImageSlider!
    var imagesArray = [MainImages]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presnter = PresenterImageSlider()
        
        presnter.reciveImage(imagesArray: imagesArray)
     
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
           setupView()
    }
    
    
    func setupView(){
        sliderCollectionView.register(UINib(nibName: "ImageSliderCell", bundle: nil), forCellWithReuseIdentifier: "ImageSliderCell")
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        
         let indexpath = IndexPath(item: selectedIndex, section: 0)
        sliderCollectionView.scrollToItem(at: indexpath, at: .init(), animated:true)
        
    }
    @IBAction func closeBtn(_ sender:UIButton){
        dismiss(animated: true, completion: nil)
    }
}
extension ImageSliderVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presnter.sendCountToCollection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageSliderCell", for: indexPath) as? ImageSliderCell{
            presnter.configureCell(cell: cell, index: indexPath.row)
            return cell
            
        }else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         alertUserWithHandler(title: "save", message: "do you want to save this image") { (action) in
//                   if let url = URL(string: imagestring),
//                       let data = try? Data(contentsOf: url),
//                       let image = UIImage(data: data) {
//                       UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                   }
               }
    }
   
  

