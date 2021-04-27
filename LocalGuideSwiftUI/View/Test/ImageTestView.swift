//
//  ImageTestView.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-04-26.
//

import SwiftUI

struct ImageTestView: View {
    @State private var showingImagePicker = false;
    @State private var inputImage: UIImage?
    @State private var filterIntensity = 0.5;
    @State private var image: Image?
    var body: some View {
        
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.secondary)
                
                // display the image
                if image != nil {
                    image?
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
            .onTapGesture {
                // select an image
                self.showingImagePicker = true;
            }
            
            HStack {
                Text("Intensity")
                Slider(value: self.$filterIntensity)
            }.padding(.vertical)
            
            HStack {
                Button("Change Filter") {
                    // change filter
                }
                
                Spacer()
                
                Button(action: {uploadImage()}){
                    Text("Save")
                    // save the picture
                }
            }
        }
        .padding([.horizontal, .bottom])
        .navigationBarTitle("Instafilter")
        .sheet(isPresented: $showingImagePicker,onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
    
    func uploadImage() {
        let mediaService = MediaService.shared
        mediaService.upLoadImage(imageData: inputImage!.pngData()!)
    }
}



struct ImageTestView_Previews: PreviewProvider {
    static var previews: some View {
        ImageTestView()
    }
}
