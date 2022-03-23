//
//  SaveImage.swift
//  PickerView_Demo
//
//  Created by Asem on 23/03/2022.
//

import UIKit

class SaveImage : NSObject {
    func writeToPhotoLibarary(image:UIImage){
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    @objc func saveCompleted(_ image:UIImage,didFinishedSavingWithError:Error?,contextOnfo:UnsafeRawPointer){
        print("save finshed")
        
    }
}
