//
//  IO.swift
//  TaskTracker
//
//  Created by William Wood on 18/6/2026.
//

import Foundation

//saves all tasks to a json as it is a structured, simple and readable file that can be called upon
func savetoFile() {
    let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

    do {

       let encoder = JSONEncoder()

       encoder.outputFormatting = .prettyPrinted

       let jsonData = try! encoder.encode(tasks)

       let jsonString: String = String(data: jsonData, encoding: .utf8)!

       let jsonURL: URL = URL(fileURLWithPath: "tasks.json", relativeTo: directoryURL)

       try jsonString.write(to: jsonURL, atomically: true, encoding: .utf8)
//test print statement to see if it works
       print("file was successfully exported")

    } catch {
//test print statement if it fails
       print("file could not be exported")

    }
}


//loads all tasks from the json
func loadtoFile() {
    let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    do {

       let decoder = JSONDecoder()

       let jsonURL = URL(fileURLWithPath: "tasks.json", relativeTo: directoryURL)

       let jsonData = try Data(contentsOf: jsonURL)

       tasks = try decoder.decode([Task].self, from: jsonData)
//test print statement to see if it works
       print("json file was successfully imported")

    } catch {
//test print statement to see if it fails
       print("file could not be imported")

    }
}
