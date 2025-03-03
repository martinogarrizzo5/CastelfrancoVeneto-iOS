//
//  DownloadJSON.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 31/03/22.
//

import Foundation
import UIKit

public class DownloadJSON {
    
    private var onFinish: (Zona) -> Void
    
    public init(method: @escaping (Zona) -> Void) {
        self.onFinish = method
    }
    
    public func getJSONzona(from id: Int) {
        
        let link = "http://prolococasteo.altervista.org/index.php/zona?zona=" + String(id)
        print(link)
        guard let url = URL(string: link) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else {
                print("error")
                return }
			
            if let zona = try? JSONDecoder().decode(Zona.self, from: data)
            {
                print(zona)
                self.onFinish(zona)
            }
        }.resume()
    }
}
