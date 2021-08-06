//
//  ContentView.swift
//  Algo
//
//  Created by Wei Zhang on 7/26/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Number of islands").onTapGesture {
                let input = [[0, 0, 0, 0, 1],
                             [1, 1, 0, 0, 1],
                             [0, 0, 0, 0, 1]]
                numberOfIslandsOf1s(input: input)
            }
            Text("Topological sorting").onTapGesture {
                let topologicalSorting = ToplogicalSorting(graph: ToplogicalSorting.generateDAG())
                do {
                    let sorted = try topologicalSorting.sorted()
                    print(sorted)
                } catch ToplogicalSortingError.notADAG {
                    print("Not a DAG")
                } catch {
                   print("Other error")
                }
            }
            Text("Topological sorting Cycle").onTapGesture {
                let topologicalSorting = ToplogicalSorting(graph: ToplogicalSorting.generateCycle())
                do {
                    let sorted = try topologicalSorting.sorted()
                    print(sorted)
                } catch ToplogicalSortingError.notADAG {
                    print("Not a DAG")
                } catch {
                   print("Other error")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
