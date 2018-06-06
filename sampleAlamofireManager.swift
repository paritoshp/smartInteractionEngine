//
//  sampleAlamofireManager.swift
//  smartInteractionEngine
//
//  Created by Paritosh Pawar on 06/06/18.
//

import UIKit
import CoreNFC
import Alamofire

@available(iOS 11.0, *)
public class sampleAlamofireManager: NSObject {
    
    //Class constants
    let URL_TO_GET_DATA_WITH_NFCID = "http://s2-dev-mobile-2:3232/smart-interaction-engine/api/v1/engine/events"
    
    // Class Variables
    private var nfcSession: NFCNDEFReaderSession?
    private var nfcMessages: [[NFCNDEFMessage]] = []
    
    //Method which make simple post API call with help of Alamofire
    //It will give a callback in app contaning this framework
    public  func makePostCallWithAlamofire(NFCID : String, completionHandler: @escaping (_ responseDict : NSDictionary) -> ()) {
        let parameters: [String: Any] = [
            "deviceId" : "123",
            "eventSourceId" : 502,
            "eventParameters": [
                "nfcTagId" : "1234",
                "ndefData" : "Hi, I am NFC tag"
            ],
            "eventName" : "NFCScannedEvent"
        ]
        print(parameters)
        Alamofire.request("http://s2-dev-mobile-2:3232/smart-interaction-engine/api/v1/engine/events", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
                // Handle Status
                if let result = response.result.value {
                    let JSON = result as! NSDictionary
                    print(JSON)
                    completionHandler(JSON)
                }
        }
    }
}
