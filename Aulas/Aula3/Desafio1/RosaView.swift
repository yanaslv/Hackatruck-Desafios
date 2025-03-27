//
//  RosaView.swift
//  Desafio1
//
//  Created by Turma01-28 on 21/03/25.
//

import SwiftUI

struct RosaView: View {
    var body: some View {
        ZStack{
            Color.pink
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "paintbrush")
                    .resizable()
                    .padding(50)
                    .scaledToFit()
                    .background(.black)
                    .clipShape(Circle())
                    .foregroundStyle(.pink)
                    .padding()
            }
        }
    }
}

#Preview {
    RosaView()
}
