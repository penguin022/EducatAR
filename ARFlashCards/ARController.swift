//
//  ARController.swift
//  ARFlashCards
//
//  Created by Zack Schreur on 1/19/19.
//  Copyright © 2019 Zack Schreur. All rights reserved.
//

import Foundation
import SceneKit
import ARKit
import Firebase

class ARController {
    
    weak var viewController: ViewController! // view controller this is in
    weak var firebaseCom: FirebaseCommunicator! // commmunicates with firebase
    
    var cardDeck: CardDeck
    var currentFlashCard: FlashCard?
    var currentShape: SCNNode?
    var currentCard = ""
    var shapesFactory: ShapesFactory! // create 3d shapes
    
    init (viewController: ViewController) {
        self.viewController = viewController
        shapesFactory = ShapesFactory(sceneView: self.viewController.sceneView)
        self.firebaseCom = viewController.firebaseCom
        self.cardDeck = CardDeck()
    }
    
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer,
                  didAdd node: SCNNode,
                  for anchor: ARAnchor) {
        
        
        self.viewController.sceneView.scene.rootNode.enumerateChildNodes { (node, stop) in
            node.removeFromParentNode() }
        self.viewController.sceneView.session.remove(anchor: anchor)
        
        guard let imageAnchor = anchor as? ARImageAnchor else { return }
        let referenceImage = imageAnchor.referenceImage
        let imageName = referenceImage.name ?? "no name"
        print("image anchor :", imageAnchor)
        
        //        addBox(anchor: imageAnchor)
        renderNewShape(flashCardID: imageName, anchor: imageAnchor)
        DispatchQueue.main.async {
            print(imageName)
        }
    }
    
    func resetTrackingConfiguration() {
        
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else { return }
        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = referenceImages
        let options: ARSession.RunOptions = [.resetTracking, .removeExistingAnchors]
        self.viewController.sceneView.session.run(configuration, options: options)
    }
    
    func renderNewShape(flashCardID: String,anchor: ARImageAnchor) {
        print("flashCardID: ", flashCardID)
        
        currentShape = getShape(name: flashCardID, anchor: anchor)!
        if cardDeck.getCard(name: flashCardID) == nil {
            self.currentFlashCard = FlashCard(id: flashCardID,
                                              name: "",
                                              additionalText: nil)
            cardDeck.addCard(name: flashCardID, flashCard: self.currentFlashCard!)
            
        } else {
            self.currentFlashCard = cardDeck.getCard(name: flashCardID)!
        }
        
        self.viewController?.showAdditionalText(name: flashCardID)
        
        
    }
    
    // hardcoded shapes to go with flashCardIDs
    func getShape(name: String, anchor: ARImageAnchor) -> SCNNode? {
        
        let names = ["brain.scn", "earth.scn", "machine.scn", "molecule.scn", "siloxane.scn","cell.scn"]
        let randomName = names.randomElement()!
        print("RandomName", randomName)
        switch name{
            
        case("notecard01"):
            let shape = shapesFactory.createShape(
                filePath: "new.scnassets/\(randomName)",
                anchor: anchor)
            if (randomName == "cell.scn"){
                shape.scale = SCNVector3(0.000002, 0.000002, 0.000002)
            }
            else if (randomName == "molecule.scn"){
                shape.scale = SCNVector3(0.0001, 0.0001, 0.0001)
            }
            else if (randomName == "sulfuricAcid.scn"){
                shape.scale = SCNVector3(0.000001, 0.000001, 0.000001)
            }
            else if (randomName == "earth.scn"){
                shape.scale = SCNVector3(0.0001, 0.0001, 0.0001)
            }
            else if (randomName == "siloxane.scn"){
                shape.scale = SCNVector3(0.00005,0.00005,0.00005)
            }
            else{
                shape.scale = SCNVector3(0.01, 0.01, 0.01)
            }
            currentCard = "notecard01"
            return shape
            
            
            
           
            
       
            
        case("notecard02"):
            let shape = shapesFactory.createShape(
                filePath: "new.scnassets/\(randomName)",
                anchor: anchor)
            if (randomName == "cell.scn"){
                shape.scale = SCNVector3(0.000002, 0.000002, 0.000002)
            }
            else if (randomName == "molecule.scn"){
                shape.scale = SCNVector3(0.0001, 0.0001, 0.0001)
            }
            else if (randomName == "sulfuricAcid.scn"){
                shape.scale = SCNVector3(0.000001, 0.000001, 0.000001)
            }
            else if (randomName == "earth.scn"){
                shape.scale = SCNVector3(0.0001, 0.0001, 0.0001)
            }
            else if (randomName == "siloxane.scn"){
                shape.scale = SCNVector3(0.00005,0.00005,0.00005)
            }
            else{
                shape.scale = SCNVector3(0.01, 0.01, 0.01)
            }
            currentCard = "notecard01"
            return shape
        case("notecard03"):
            let shape = shapesFactory.createShape(
                filePath: "new.scnassets/\(randomName)",
                anchor: anchor)
            if (randomName == "cell.scn"){
                shape.scale = SCNVector3(0.000002, 0.000002, 0.000002)
            }
            else if (randomName == "molecule.scn"){
                shape.scale = SCNVector3(0.0001, 0.0001, 0.0001)
            }
            else if (randomName == "sulfuricAcid.scn"){
                shape.scale = SCNVector3(0.000001, 0.000001, 0.000001)
            }
            else if (randomName == "earth.scn"){
                shape.scale = SCNVector3(0.0001, 0.0001, 0.0001)
            }
            else if (randomName == "siloxane.scn"){
                shape.scale = SCNVector3(0.00005,0.00005,0.00005)
            }
            else{
                shape.scale = SCNVector3(0.01, 0.01, 0.01)
            }
            currentCard = "notecard01"
            return shape
            
            
        case("notecard04"):
            let shape = shapesFactory.createShape(
                filePath: "new.scnassets/\(randomName)",
                anchor: anchor)
            if (randomName == "cell.scn"){
                shape.scale = SCNVector3(0.000002, 0.000002, 0.000002)
            }
            else if (randomName == "molecule.scn"){
                shape.scale = SCNVector3(0.0001, 0.0001, 0.0001)
            }
            else if (randomName == "sulfuricAcid.scn"){
                shape.scale = SCNVector3(0.000001, 0.000001, 0.000001)
            }
            else if (randomName == "earth.scn"){
                shape.scale = SCNVector3(0.0001, 0.0001, 0.0001)
            }
            else if (randomName == "siloxane.scn"){
                shape.scale = SCNVector3(0.00005,0.00005,0.00005)
            }
            else{
                shape.scale = SCNVector3(0.01, 0.01, 0.01)
            }
            currentCard = "notecard01"
            return shape
            
            //            shape = shapesFactory.createShape(
            //                filePath: "new.scnassets/sulfuricAcid.scn",
            //                anchor: anchor)
            //            shape.scale = SCNVector3(0.001,0.001,0.001)
            
            //            shape = shapesFactory.createShape(
            //                filePath: "new.scnassets/electronMicroscope.scn",
            //                anchor: anchor)
            //            shape.scale = SCNVector3(0.001,0.001,0.001)
            
        default:
            print("not working")
        }
        
        return nil
    }
}
