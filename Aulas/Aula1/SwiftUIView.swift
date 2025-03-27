//
//  SwiftUIView.swift
//  Aula1
//
//  Created by Turma01-28 on 19/03/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            HStack (spacing: 20) {
                Image("hackatruck")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                
                VStack(spacing: 10) {
                    Text("Hackatruck")
                        .foregroundStyle(.red)
                    Text("77 universidades")
                        .foregroundStyle(.blue)
                    Text("5 regiões do Brasil")
                        .foregroundStyle(.orange)
                }
                .padding()
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
