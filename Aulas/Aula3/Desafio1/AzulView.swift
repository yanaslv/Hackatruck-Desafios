//
//  AzulView.swift
//  Desafio1
//
//  Created by Turma01-28 on 21/03/25.
//

import SwiftUI

struct AzulView: View {
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "paintbrush.pointed")
                    .resizable()
                    .padding(50)
                    .scaledToFit()
                    .background(.black)
                    .clipShape(Circle())
                    .foregroundStyle(.blue)
                    .padding()
            }
        }
    }
}

#Preview {
    AzulView()
}
