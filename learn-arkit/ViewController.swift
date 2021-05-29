//
//  ViewController.swift
//  learn-arkit
//
//  Created by KwangSeok Hyeong on 2021/05/28.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    enum nodeType: CaseIterable {
        case ab
        case vd
        
        func getColor() -> UIColor {
            switch self {
            case .ab: return .red
            case .vd: return .blue
            }
        }
        
//        func size() ÷
        
        
    }
    
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
    
    func makeNode() -> SCNNode {
        let aaa = nodeType.allCases.randomElement()// enum 에서 랜덤값 (optional)
        
        var node = SCNNode()
        node.geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.3)
        node.geometry?.firstMaterial?.diffuse.contents = [UIColor.red, UIColor.blue].randomElement()
        
        return SCNNode()
    }
    
}

// MARK: - Helpers
extension ViewController {
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}

// MARK: - selectorss
extension ViewController {
    @objc
    func goBack() {
//        let node = SCNNode()
//        node.geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.3)
//        node.geometry?.firstMaterial?.specular.contents = UIColor.white // 반사되는 빛 색
//        //        node.geometry?.firstMaterial?.diffuse.contents = UIColor(red: a/255, green: b/255, blue: c/255, alpha: 1)
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        let x = randomNumbers(firstNum: -10, secondNum: 10)
//        let y = randomNumbers(firstNum: -10, secondNum: 14)
//        //        let z = randomNumbers(firstNum: -0.3, secondNum: -0.3)
//        node.position = SCNVector3(x, y, -10)
//        sceneView.scene.rootNode.addChildNode(node)
//        nodeArray.append(node)
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
