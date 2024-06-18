//
//  ShareDataView.swift
//  SetList
//
//  Created by Farago Barna on 18/06/2024.
//

import SwiftUI

struct ShareDataView: View {
    var body: some View {
        Text("Export/import data")
        Button(action: {
            //shareSQLiteFile()
        }) {
            Text("Share Data")
        }
    }
    //Todo: export and import using schema and migration...
    
    /*func shareSQLiteFile() {
        guard let sqliteURL = getSQLiteFileURL() else {
            print("SQLite file not found")
            return
        }
        let activityController = UIActivityViewController(activityItems: [sqliteURL], applicationActivities: nil)
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = scene.windows.first {
                window.rootViewController?.present(activityController, animated: true, completion: nil)
            }
        }
    }*/
}

#Preview {
    ShareDataView()
}

/*
func getSQLiteFileURL() -> URL? {
    let fileManager = FileManager.default
    let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
    guard let documentsDirectory = urls.first else {
        return nil
    }
    // This version of the SwiftData does not use sqlite.
    let sqliteURL = documentsDirectory.appendingPathComponent("SetList.sqlite")
    return sqliteURL
}
*/
