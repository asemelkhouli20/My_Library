//
//  ImagePicker.swift
//  PickerView_Demo
//
//  Created by Asem on 22/03/2022.
//

import SwiftUI
import PhotosUI

struct ImagePicker:UIViewControllerRepresentable {
   
    @Binding var image:UIImage?
    
    class Coordinator: NSObject,PHPickerViewControllerDelegate {
        var parent : ImagePicker
        
        init(_ parent:ImagePicker) { self.parent=parent }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let provide = results.first?.itemProvider else {return}
            
            if provide.canLoadObject(ofClass: UIImage.self){
                provide.loadObject(ofClass: UIImage.self) { (image, _ ) in  self.parent.image = image as? UIImage }
            }
            
        }
    }
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var confj = PHPickerConfiguration()
        confj.filter = .images
        
        let picker = PHPickerViewController(configuration: confj)
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator { Coordinator(self) }
    
    
}
