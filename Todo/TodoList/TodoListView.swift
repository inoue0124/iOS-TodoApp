//
//  TodoListView.swift
//  Todo
//
//  Created by Yusuke Inoue on 2023/12/23.
//

import SwiftUI

struct TodoListView: View {
    final class ViewState: ObservableObject {
        @Published var todoList: [TodoModel] = []
    }
    
    @ObservedObject var viewState = ViewState()

    var onTapIcon: (UUID) -> Void = { _ in }
    var onTapAddTodoButton: () -> Void = {}

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List {
                ForEach(viewState.todoList) { todo in
                    HStack {
                        Button(action: { onTapIcon(todo.id) }) {
                            Image(uiImage: todo.status.icon)
                                .renderingMode(.template)
                                .foregroundColor(.blue)
                        }
                        Text(todo.title)
                        Spacer()
                        Text(todo.label)
                            .foregroundColor(.orange)
                    }
                }
            }
            .listStyle(.plain)
            
            Button(action: onTapAddTodoButton) {
                Text("+")
                    .font(.title)
                    .frame(width: 50, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .padding(.trailing, 16)
            .padding(.bottom, 16)
        }
    }
}

