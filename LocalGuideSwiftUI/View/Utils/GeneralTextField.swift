//
//  GeneralTextField.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng Song on 2021-04-24.
//

import SwiftUI

struct GeneralTextField: View {
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    
    
    var body: some View {
        ZStack(alignment:.leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(.gray)
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                TextField("", text: $text)
            }
        }
    }
}

