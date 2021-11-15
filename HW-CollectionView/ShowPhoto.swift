//
//  ShowPhoto.swift
//  HW-CollectionView
//
//  Created by Yousef Alasmar on 10/04/1443 AH.
//

import UIKit

class ShowPhoto: UIViewController {

    var ShImg = UIImage()
    
    @IBOutlet weak var ShowImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ShowImg.image = ShImg
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
