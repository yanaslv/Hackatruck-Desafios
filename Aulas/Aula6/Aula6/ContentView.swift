//
//  ContentView.swift
//  Aula6
//
//  Created by Turma01-28 on 26/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gryffindor
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        AsyncImage(url: URL(string: "https://mcdn.wallpapersafari.com/medium/14/45/8XF6in.jpg")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        
                        AsyncImage(url: URL(string: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/946397ca-37b3-4eed-9a27-6182d454e626/de0kjre-c20de09d-c0b8-4c67-b4b1-292217d2db93.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzk0NjM5N2NhLTM3YjMtNGVlZC05YTI3LTYxODJkNDU0ZTYyNlwvZGUwa2pyZS1jMjBkZTA5ZC1jMGI4LTRjNjctYjRiMS0yOTIyMTdkMmRiOTMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.xC29ZjndzWaSPWaQaSvq3CDkICZkJ6M1a5OZ-QCuRoc")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 150, height: 200)
                        .shadow(radius: 20)
                        .tint(.black)
                    }
                    Spacer()
                    
                    ScrollView {
                        VStack{
                            ForEach(viewModel.personagens, id: \.id) { character in
                                HStack {
                                    NavigationLink(destination: CharView(recebe: character)) {
                                        AsyncImage(url: URL(string: character.image!)) { image in image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        
                                        Spacer()
                                        
                                        Text(character.name!)
                                            .foregroundStyle(.white)
                                        
                                        Spacer()
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
                .ignoresSafeArea()
            }
        }.tint(.white)
        .onAppear() {
            viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
