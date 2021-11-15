//
//  ViewController.swift
//  HW-CollectionView
//
//  Created by Yousef Alasmar on 10/04/1443 AH.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate , UICollectionViewDelegate , UICollectionViewDataSource {
    
    var num = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! PhotoCell
        cell.Photo.image = imgArray[indexPath.row]
        num = indexPath.row
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let show = storyboard?.instantiateViewController(withIdentifier: "showId") as? ShowPhoto
        navigationController?.show(show!, sender: self)
        show?.ShImg = imgArray[indexPath.item]
        
    }
    var image : UIImage!
    
    @IBOutlet weak var Collection: UICollectionView!
    
    var imgArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Collection.delegate = self
        Collection.dataSource = self
    }
    
    @IBAction func Add(_ sender: Any) {
        
        let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Album", style: .default , handler:{ (UIAlertAction)in
            
            let VC = UIImagePickerController()
            VC.delegate = self
            VC.sourceType = .photoLibrary
            VC.allowsEditing = true
            self.present(VC, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Camera", style: .default , handler:{ (UIAlertAction)in
            
            let cameraVC = UIImagePickerController()
            cameraVC.delegate = self
            cameraVC.sourceType = .camera
            self.present(cameraVC, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
        }))
        
        self.present(alert, animated: true, completion: {
        })
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        info[.originalImage]
        let pic = info[.originalImage] as! UIImage
        imgArray.append(pic)
        print(imgArray)
        Collection.reloadData()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func longPress(_ sender: Any) {
        let Alert2 = UIAlertController(title: "Are you sure to Delete", message: nil, preferredStyle: .alert)
            Alert2.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: {action in
              self.imgArray.remove(at: self.num)
              self.Collection.reloadData()
            }))
            Alert2.addAction(UIAlertAction(title: "NO", style: .default, handler: {action in
            }))
            present(Alert2, animated: true, completion: nil)
    }
    @IBAction func delButton(_ sender: Any) {
        
        let Alert = UIAlertController(title: "Are you sure to delete", message: "delete all images", preferredStyle: .alert)
        Alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        Alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: {action in
            self.imgArray.removeAll()
            self.Collection.reloadData()
            
        }))
        present(Alert, animated: true, completion: nil)
    }
}

