//
//  ImageResource.swift
//  hackaApp-iOS
//
//  Created by José Guilherme Bestel on 30/07/21.
//

import Foundation
import UIKit
import Firebase
//import FirebaseUI

class ImageResource{
    
    static func upload(name :String, image: UIImage, completion : @escaping ( _ url: URL?)-> ()){

        let storageRef = Storage.storage().reference().child("name")
        let imageData = image.jpegData(compressionQuality: 0.1)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"

        storageRef.putData(imageData!, metadata: metaData) { (metadata, error) in
            if error == nil {
                storageRef.downloadURL(completion: { (url, error) in
                    completion(url)
                })
            }   else {
                print("error: \(error)")
                completion(nil)
            }
        }

    }
}
