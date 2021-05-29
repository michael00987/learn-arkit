//
//  ViewController.swift
//  learn-arkit
//
//  Created by KwangSeok Hyeong on 2021/05/28.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    let addButton = UIButton()
    let resetButton = UIButton()

    var nodeArray: [SCNNode] = []
    
    let sceneView: ARSCNView = ARSCNView()
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI() // UI 셋팅
        setBase() // 초기 셋팅
        sceneView.frame = view.bounds
        // Do any additional setup after loading the view.
        sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        sceneView.session.run(configuration)
        sceneView.autoenablesDefaultLighting = true // 빛 반사 여부
        
        
    }
}

// MARK: - Helpers
extension ViewController {
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}
extension Double {
    var toDegree: Double {return Double(self) * .pi/180}
}

// MARK: - selectorss
extension ViewController {
    @objc
    func goBack() {
        
        let x1 = randomNumbers(firstNum: -10, secondNum: 10)
        let y1 = randomNumbers(firstNum: -10, secondNum: 14)
//        let z = randomNumbers(firstNum: -0.3, secondNum: -0.3)
        let node1 = SCNNode()
        node1.geometry = SCNBox(width: 1, height: 2, length: 3, chamferRadius: 0.3)
//        node1.eulerAngles = SCNVector3(CGFloat(30.toDegree),0,0)
        node1.geometry?.firstMaterial?.specular.contents = UIColor.white // 반사되는 빛 색
        node1.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        node1.position = SCNVector3(x1, y1, -10)
        sceneView.scene.rootNode.addChildNode(node1)
        
        
        let x2 = randomNumbers(firstNum: -10, secondNum: 10)
        let y2 = randomNumbers(firstNum: -10, secondNum: 14)
        let node2 = SCNNode()
        node2.geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.3)
        node2.geometry?.firstMaterial?.specular.contents = UIColor.white // 반사되는 빛 색
        node2.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        node2.position = SCNVector3(x2, y2, -10)
        sceneView.scene.rootNode.addChildNode(node2)
        
        
        let x3 = randomNumbers(firstNum: -10, secondNum: 10)
        let y3 = randomNumbers(firstNum: -10, secondNum: 14)
        let node3 = SCNNode()
        node3.geometry = SCNCapsule(capRadius: 1, height: 10)
        node3.geometry?.firstMaterial?.specular.contents = UIColor.white // 반사되는 빛 색
        node3.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        node3.position = SCNVector3(x3, y3, -10)
        sceneView.scene.rootNode.addChildNode(node3)
        
        let x4 = randomNumbers(firstNum: -10, secondNum: 10)
        let y4 = randomNumbers(firstNum: -10, secondNum: 14)
        let node4 = SCNNode()
        node4.geometry = SCNCapsule(capRadius: 1, height: 10)
        node4.geometry?.firstMaterial?.specular.contents = UIColor.white // 반사되는 빛 색
        node4.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        node4.position = SCNVector3(x4, y4, -10)
        sceneView.scene.rootNode.addChildNode(node4)
        
        
        let x5 = randomNumbers(firstNum: -10, secondNum: 10)
        let y5 = randomNumbers(firstNum: -10, secondNum: 14)
        let node5 = SCNNode()
        node5.geometry = SCNCylinder(radius: 4, height: 10)
        node5.geometry?.firstMaterial?.specular.contents = UIColor.white // 반사되는 빛 색
        node5.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        node5.position = SCNVector3(x5, y5, -10)
        sceneView.scene.rootNode.addChildNode(node5)
        
        let x6 = randomNumbers(firstNum: -10, secondNum: 10)
        let y6 = randomNumbers(firstNum: -10, secondNum: 14)
        let node6 = SCNNode()
        node6.geometry = SCNSphere(radius: 5)
        node6.geometry?.firstMaterial?.specular.contents = UIColor.white // 반사되는 빛 색
        node6.geometry?.firstMaterial?.diffuse.contents = UIColor.black
        node6.position = SCNVector3(x6, y6, -10)
        sceneView.scene.rootNode.addChildNode(node6)
        
        let x7 = randomNumbers(firstNum: -10, secondNum: 10)
        let y7 = randomNumbers(firstNum: -10, secondNum: 14)
        let node7 = SCNNode()
        node7.geometry = SCNTube(innerRadius: 1, outerRadius: 2, height: 3)
        node7.geometry?.firstMaterial?.specular.contents = UIColor.white // 반사되는 빛 색
        node7.geometry?.firstMaterial?.diffuse.contents = UIColor.darkGray
        node7.position = SCNVector3(x7, y7, -10)
        sceneView.scene.rootNode.addChildNode(node7)
        
        
        let x8 = randomNumbers(firstNum: -10, secondNum: 10)
        let y8 = randomNumbers(firstNum: -10, secondNum: 14)
        let node8 = SCNNode()
        node8.geometry = SCNTorus(ringRadius: 3, pipeRadius: 1)
        node8.geometry?.firstMaterial?.specular.contents = UIColor.white // 반사되는 빛 색
        node8.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        node8.position = SCNVector3(x8, y8, -10)
        sceneView.scene.rootNode.addChildNode(node8)
        
        let x9 = randomNumbers(firstNum: -10, secondNum: 10)
        let y9 = randomNumbers(firstNum: -10, secondNum: 14)
        let node9 = SCNNode()
        node9.geometry = SCNPlane(width: 2, height: 4)
        node9.geometry?.firstMaterial?.specular.contents = UIColor.white // 반사되는 빛 색
        node9.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        node9.position = SCNVector3(x9, y9, -10)
        sceneView.scene.rootNode.addChildNode(node9)
        
        let x10 = randomNumbers(firstNum: -10, secondNum: 10)
        let y10 = randomNumbers(firstNum: -10, secondNum: 14)
        let node10 = SCNNode()
        node10.geometry = SCNPyramid(width: 1, height: 3, length: 2)
        node10.geometry?.firstMaterial?.specular.contents = UIColor.white // 반사되는 빛 색
        node10.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        node10.position = SCNVector3(x10, y10, -10)
        sceneView.scene.rootNode.addChildNode(node10)
        
        
        let x11 = randomNumbers(firstNum: -10, secondNum: 10)
        let y11 = randomNumbers(firstNum: -10, secondNum: 14)
        let node11 = SCNNode()
        let path11 = UIBezierPath()
        path11.move(to: CGPoint(x: 0, y: 0))
        path11.addLine(to: CGPoint(x: 0, y: 2))
        let shape11 = SCNShape(path: path11, extrusionDepth: 1)
        node11.geometry = shape11
        node11.geometry?.firstMaterial?.specular.contents = UIColor.white // 반사되는 빛 색
        node11.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan
        node11.position = SCNVector3(x11, y11, -10)
        sceneView.scene.rootNode.addChildNode(node11)
        
        
        let x12 = randomNumbers(firstNum: -10, secondNum: 10)
        let y12 = randomNumbers(firstNum: -10, secondNum: 14)
        let node12 = SCNNode()
        let path12 = UIBezierPath()
        path12.move(to: CGPoint(x: 0, y: 0))
        path12.addLine(to: CGPoint(x: 0, y: 2))
        path12.addLine(to: CGPoint(x: -2, y: 2))
        path12.addLine(to: CGPoint(x: -2, y: 4))
        path12.addLine(to: CGPoint(x: 0, y: 4))
        path12.addLine(to: CGPoint(x: 0, y: 6))
        path12.addLine(to: CGPoint(x: 2, y: 6))
        path12.addLine(to: CGPoint(x: 2, y: 4))
        path12.addLine(to: CGPoint(x: 4, y: 4))
        path12.addLine(to: CGPoint(x: 4, y: 2))
        path12.addLine(to: CGPoint(x: 2, y: 2))
        path12.addLine(to: CGPoint(x: 2, y: 0))
        // 마지막 위치와 처음 위치를 자동으로 연결한다.
        let shape12 = SCNShape(path: path12, extrusionDepth: 1)
        node12.geometry = shape12
        node12.geometry?.firstMaterial?.specular.contents = UIColor.white // 반사되는 빛 색
        node12.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan
        node12.position = SCNVector3(x12, y12, -10)
        sceneView.scene.rootNode.addChildNode(node12)
        
        
    }
    
    @objc
    func reset() {
        sceneView.session.pause()
        sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        sceneView.session.run(configuration,options: [.resetTracking, .removeExistingAnchors])
    }
}

// MARK: - UI
extension ViewController {
    func setBase(){
        addButton.setTitle("ADD", for: .normal)
        addButton.backgroundColor = .blue
        addButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        resetButton.setTitle("Reset", for: .normal)
        resetButton.backgroundColor = .red
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        
    }
    func setUI(){
        [sceneView, addButton, resetButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            resetButton.bottomAnchor.constraint(equalTo: addButton.topAnchor),
            resetButton.leadingAnchor.constraint(equalTo: addButton.trailingAnchor),
            
        ])
        
    }
}
