//
//  HomeViewController.swift
//  CandyBust
//
//  Created by koshal singh shekhawat on 11/09/23.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource  {

    
    //MARK: -> Outlets
    @IBOutlet weak var iconPhotoView: UIView!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressTopView: UIView!
    @IBOutlet weak var sideConstentent: NSLayoutConstraint!
    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var btnImg: UIImageView!
    @IBOutlet weak var playButton: UIButton!
   
    //MARK: -> variables
    var progress: Float = 0.0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationItem.hidesBackButton = true
        
    //MARK: -> CornerRadius
    iconPhotoView.layer.cornerRadius = 15
    downloadButton.layer.cornerRadius = 30
    
    progressView.layer.cornerRadius = progressTopView.frame.height/4
    sideConstentent.constant = 0
    btnView.isHidden = true
    }
    
    //MARK: -> Action
    @IBAction func downloadButton(_ sender: UIButton) {
    progressView.setProgress(progress, animated: true)
    timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector (self.updateProgrerss), userInfo: nil, repeats: true)
    sideConstentent.constant = 50
    btnView.isHidden = false
    btnImg.image = UIImage(named:"wrong")
    downloadButton.setTitle("10 MB/ 30 MB", for: .normal)
    downloadButton.backgroundColor = .clear
    }

    @IBAction func playButtonAction(_ sender: UIButton) {
    let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "PlayViewController") as! PlayViewController
    nextVC.modalPresentationStyle = .overFullScreen
    nextVC.modalTransitionStyle  =  .coverVertical
    present(nextVC, animated: true)
    }
    
    
    @objc func updateProgrerss() {
    progress = progress + 0.01
    progressView.progress = progress
    
    if progress >= 1 {
       timer?.invalidate()
       timer = nil
       btnImg.image = UIImage(named:"wrigth")
       }
            
    if (progress >= 1) == true {
        btnView.isHidden = true
        progressTopView.isHidden = true
        playButton.isHidden = false
        playButton.setTitle("PLAY", for: .normal)
        playButton.backgroundColor = .blue
        downloadButton.isHidden = true
        playButton.layer.cornerRadius  = 20
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        playButton.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    //MARK: -> CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        return cell
    }

}
