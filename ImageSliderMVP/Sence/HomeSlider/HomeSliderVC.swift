//
//  ViewController.swift
//  ImageSliderMVP
//
//  Created by Ateek on 5/30/20.
//  Copyright © 2020 Ateek. All rights reserved.
//

import UIKit

class HomeSliderVC: UIViewController {
    @IBOutlet weak var imagesCollectionView:UICollectionView!
    var presenter:PresnterHomeSliders!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = PresnterHomeSliders(view: self )
        presenter.getImages()
        setupView()
    }
    
    func setupView(){
        imagesCollectionView.register(UINib(nibName: "HomeSliderCell", bundle: nil), forCellWithReuseIdentifier: "HomeSliderCell")
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
       
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

extension HomeSliderVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.sendCountToTableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSliderCell", for: indexPath) as? HomeSliderCell{
            presenter.configureSliderCell(cell: cell, index: indexPath.row)
            return cell
        }else {
            return UICollectionViewCell()
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (imagesCollectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectCell(index: indexPath.row)
    }
}
extension HomeSliderVC: PresenterHomeSliderView{
    func didLoadImages() {
        imagesCollectionView.reloadData()
    }
    
    func showErrors(title: String, message: String) {
        alertUser(title: title, message: message)
    }
    
    func showLoading() {
        // here you can add loading when calling api
    }
    
    func hideLoading() {
        // after respone you can hide the loading view
        
    }
    
    func moveToImageInfo(images:[MainImages],index:Int) {
        guard let sliderVC = storyboard?.instantiateViewController(withIdentifier: "ImageSliderVC") as? ImageSliderVC else {return}
        sliderVC.imagesArray = images
        sliderVC.selectedIndex = index
        sliderVC.modalPresentationStyle = .fullScreen
        self.present(sliderVC,animated: true)
    }
    
    
}
