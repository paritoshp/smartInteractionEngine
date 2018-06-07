//
//  NFCViewController.swift
//  SmartInteraction
//
//  Created by Paritosh Pawar on 07/06/18.
//

import UIKit
import CoreNFC

@available(iOS 11.0, *)
public class NFCViewController: UIViewController {
    
    public var nfcSession: NFCNDEFReaderSession?
    public var NFCTagID = ""
    public var nfcMessages: [[NFCNDEFMessage]] = []
    
    let delimiter = "Payload Type=<"
    var finalString : String = "1234-4321-1234"
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.callNFCDetectionMethod()
        
        // Do any additional setup after loading the view.
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func callNFCDetectionMethod() {
        nfcSession = NFCNDEFReaderSession.init(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        nfcSession?.begin()
    }
}

@available(iOS 11.0, *)
extension NFCViewController : NFCNDEFReaderSessionDelegate {
    
    // Called when the reader-session expired, you invalidated the dialog or accessed an invalidated session
    public func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("Error reading NFC: \(error.localizedDescription)")
    }
    
    // Called when a new set of NDEF messages is found
    // Code Change here for actual NFCTAG
    public func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        print("New NFC Tag detected:")
        
        for message in messages {
            for record in message.records {
                print("Type name format: \(record.typeNameFormat)")
                print("Payload: \(record.payload)")
                print("Type: \(record.type)")
                print("Identifier: \(record.identifier)")
                self.NFCTagID = "\(record)" // Used beacause we are scanning beacons for NFCtags
                //              self.NFCTagID = "\(record.identifier)" // use this in case of nfc tags
            }
            self.getProperNFCID()
        }
        
        // Add the new messages to our found messages
        self.nfcMessages.append(messages)
    }
    
    //Get proper NFCID with string conversion
    func getProperNFCID() {
        
        var token = self.NFCTagID.components(separatedBy: delimiter)
        if let range = token[1].range(of: ">") {
            finalString = String(token[1][token[1].startIndex..<range.lowerBound])
        }
        DispatchQueue.main.async {
            //            self.sensorIDString.text = ("NFCID: \(self.finalString)")
        }
        sampleAlamofireManager().makePostCallWithAlamofire(NFCID: finalString, completionHandler: {
            dict in
            print(dict)
            var actionResponseMapDict = [String:Any]()
            actionResponseMapDict = dict["actionResponseMap"] as! [String:Any]
            var OpenUrlActionDict = [String:Any]()
            OpenUrlActionDict = actionResponseMapDict["OpenUrlAction"] as! [String:Any]
            
            var responseDict = [String:Any]()
            responseDict = OpenUrlActionDict["response"] as! [String:Any]
            UIApplication.shared.open(URL(string : responseDict["url"] as! String)!, options: [:], completionHandler: { (status) in
            })
        })
    }
}
