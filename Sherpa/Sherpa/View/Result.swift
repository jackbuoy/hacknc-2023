//
//  Result.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

struct Result: View {
    @StateObject var resultVM: ResultViewModel = .init()
    @Namespace var animation
    
    var vacationDays: [Date] = []
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
               
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(self.resultVM.currentWeek, id: \.self) { day in
                                
                                Button {
                                    // change what part of the itinerary is shown
                                } label: {
                                    VStack(spacing: 10) {
                                        Text(self.resultVM.extractDate(date: day, format: "dd"))
                                            .font(.system(size: 14))
                                            .fontWeight(.semibold)
                                        
                                        Text(self.resultVM.extractDate(date: day, format: "EEE"))
                                            .font(.system(size: 14))
                                        
                                        Circle()
                                            .fill(.white)
                                            .frame(width: 8, height: 8)
                                            .opacity(self.resultVM.isToday(date: day) ? 1 : 0)
                                    }
                                    .foregroundStyle(self.resultVM.isToday(date: day) ? .primary : .secondary)
                                    .foregroundColor(self.resultVM.isToday(date: day) ? .white : .black)
                                    .frame(width: 45, height: 90)
                                    .background(
                                        ZStack {
                                            if self.resultVM.isToday(date: day) {
                                                Capsule()
                                                    .fill(.black)
                                                    .matchedGeometryEffect(id: "CURRENTDAY", in: self.animation)
                                            }
                                        })
                                    .contentShape(Capsule())
                                    .onTapGesture {
                                        withAnimation {
                                            self.resultVM.currentDay = day
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    TaskView()
                } header: {
                    self.HeaderView()
                }
            }
        }
    }
    
    func TaskView() -> some View{
        
        LazyVStack (spacing: 18){
            
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
