//
//  Result.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

struct Result: View {
    @StateObject var resultVM: ResultViewModel = .init()
    
    var vacationDays: [Date] = []
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                self.HeaderView()
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(self.resultVM.currentWeek, id: \.self) { day in
                                
                                Button {
                                    //change what part of the itinerary is shown
                                } label: {
                                    VStack(spacing: 10) {
                                        Text(self.resultVM.extractDate(date: day, format: "dd"))
                                            .font(.system(size: 14))
                                            .fontWeight(.semibold)
                                        
                                        Text(self.resultVM.extractDate(date: day, format: "EEE"))
                                            .font(.system(size: 14))
                                    }
                                    .foregroundColor(.white)
                                    .frame(width: 45, height: 90)
                                    .background(
                                        ZStack {
                                            Capsule().fill(.black)
                                        })
                                }

                              
                            }
                        }
                        .padding(.horizontal)
                    }
                } header: {}
            }
        }
    }
    
    func HeaderView() -> some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .foregroundStyle(.gray)
                Text("Today")
                    .font(.largeTitle.bold())
            }
            .hLeading()
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    Result()
}

extension View {
    func hLeading() -> some View {
        self
            .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }

    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }

    func hCenter() -> some View {
        self
            .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: .center)
    }
}
