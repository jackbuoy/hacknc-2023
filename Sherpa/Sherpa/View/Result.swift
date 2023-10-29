//
//  Result.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

struct Result: View {
    
    var vacationDays: [Date] = []
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10){
                            
                        }
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
