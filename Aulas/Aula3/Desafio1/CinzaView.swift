//
//  CinzaView.swift
//  Desafio1
//
//  Created by Turma01-28 on 21/03/25.
//

import SwiftUI

struct CinzaView: View {
    var body: some View {
        ZStack{
            Color.gray
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "paintpalette")
                    .resizable()
                    .padding(50)
                    .scaledToFit()
                    .background(.black)
                    .clipShape(Circle())
                    .foregroundStyle(.gray)
                    .padding()
            }
        }
    }
}

#Preview {
    CinzaView()
}
