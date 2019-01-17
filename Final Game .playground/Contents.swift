// Created on: November 21
// Created by: Adam 
// Created for: ICS3U
// retro tennis 
// pong middle background by: Ian 
// the way the enemy paddle moves idea was by me and my dad
// restitution is the amount of bounciness given to whatever colided with it and I found that in that code in the offical apple website.
// linear damping is the how you can make go gradually slower or faster wich was found in the apple website.

import PlaygroundSupport
import SpriteKit
 
// global variable for the score
var DIFIC : Double = 0 

class GameScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let SplashSceneBackground = SKSpriteNode(imageNamed: "IMG_1028.PNG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 3)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 1, green:1, blue:1, alpha: 1.0)
        
        SplashSceneBackground.name = "Splash scene background"
        SplashSceneBackground.position = CGPoint(x: frame.size.width/2.2, y: frame.size.height / 2.8)
        self.addChild(SplashSceneBackground) 
        SplashSceneBackground.setScale(0.5)
        
        SplashSceneBackground.run(moveToNextSceneDelay) {
            let comScene = comLogoScene(size: self.size)
            self.view!.presentScene(comScene)
            
        }
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        }
    
}

class comLogoScene: SKScene, SKPhysicsContactDelegate {
    
    // local variables to this scene
    let comSceneCom = SKSpriteNode(imageNamed: "IMG_1068.JPG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 3)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 1, green:1, blue:1, alpha: 1.0)
        
        comSceneCom.name = "company scene logo"
        comSceneCom.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        self.addChild(comSceneCom) 
        comSceneCom.setScale(0.4)
        
        comSceneCom.run(moveToNextSceneDelay) {
            let diffculiesScene = DifficultyScene(size: self.size)
            self.view!.presentScene(diffculiesScene)
            
        }
        
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}





class DifficultyScene: SKScene {
    // local variables to this scene
    let pongLabel = SKLabelNode(fontNamed: "Chalkduster")
    let easyButton = SKSpriteNode(imageNamed: "IMG_1049.PNG")
    let mediumButton = SKSpriteNode(imageNamed: "IMG_1050.PNG")
    let hardButton = SKSpriteNode(imageNamed: "IMG_1051.PNG")
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        //background
        self.backgroundColor = SKColor(red: 1, green:1, blue:1, alpha: 1)
        
        //pong
        pongLabel.text = "retro tennis"
        pongLabel.fontColor = #colorLiteral(red: 0.9254902005195618, green: 0.23529411852359772, blue: 0.10196078568696976, alpha: 1.0)
        pongLabel.fontSize = 80
        pongLabel.position = CGPoint(x: frame.size.width / 2, y: frame.size.height - 100)
        self.addChild(pongLabel)
        
        //easy
        easyButton.name = "easy button"
        easyButton.position = CGPoint(x: frame.size.width / 2 - 300 , y: frame.size.height/2)
        self.addChild(easyButton)
        easyButton.setScale(1.5)
        
        //medium 
        mediumButton.name = "medium button"
        mediumButton.position = CGPoint(x: frame.size.width / 2  , y: frame.size.height/2)
        self.addChild(mediumButton)
        mediumButton.setScale(1.5)
            
        //hard
        hardButton.name = "hard button"
        hardButton.position = CGPoint(x: frame.size.width / 2 + 300 , y: frame.size.height/2)
        self.addChild(hardButton)
        hardButton.setScale(1.5)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        // easy button pressed has a difficulty and when you press it, it makes the global variable diffrent for each diffrent.
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "easy button" {
                //UserDefaults().set(dific, forKey: "easy")
                DIFIC = 0.2
                let mainGameScene = PongScene(size: self.size)
                self.view!.presentScene(mainGameScene)
                
            } 
            
            if touchedNodeName == "medium button" {
                
                DIFIC = 0.15
                let mainGameScene = PongScene(size: self.size)
                self.view!.presentScene(mainGameScene)
            }
            
            if touchedNodeName == "hard button" {
                
                DIFIC = 0.1
                let mainGameScene = PongScene(size: self.size)
                self.view!.presentScene(mainGameScene)
                
            }
            
        }
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}


class PongScene: SKScene , SKPhysicsContactDelegate {
    
    let gameSceneBackground = SKSpriteNode(imageNamed: "IMG_5709.jpg")
    let ball = SKSpriteNode(imageNamed: "IMG_5002.PNG")
    let userP = SKSpriteNode(imageNamed: "IMG_5001.JPG")
    let enemyP = SKSpriteNode(imageNamed: "EnemyP.jpg")
    let enemyLabel = SKLabelNode(fontNamed: "chalkduster")
    let userLabel = SKLabelNode(fontNamed: "chalkduster")
    let enemyBor = SKSpriteNode(imageNamed: "LSide.jpg")
    let userBor = SKSpriteNode(imageNamed: "RSide.jpg")
    let borderR = SKSpriteNode(imageNamed: "IMG_1057.JPG")
    let borderL = SKSpriteNode(imageNamed: "IMG_1057.JPG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 5)
    let winLabel = SKLabelNode(fontNamed: "chalkduster")
    
    // the colision of the paddles
    struct CategoryBitMask {
        static let userP: UInt32 = 0b1 << 0
        static let enemyP: UInt32 = 0b1 << 1
        }
    
    //score
    var enemyScore : Int = 0
    var userScore : Int = 0
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self 
        self.backgroundColor = SKColor(red: 1, green:1, blue:1, alpha: 1)
        
        gameSceneBackground.name = "game scene background"
        gameSceneBackground.position = CGPoint(x: frame.size.width/2, y: frame.size.height / 2)
        self.addChild(gameSceneBackground) 
        gameSceneBackground.setScale(0.4)
        
        enemyLabel.text = " 0"
        enemyLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        enemyLabel.fontColor = #colorLiteral(red: 0.9254902005195618, green: 0.23529411852359772, blue: 0.10196078568696976, alpha: 1.0)
        enemyLabel.fontSize = 70
        enemyLabel.position = CGPoint(x: frame.size.width / 2 - 80, y: frame.size.height - 80)
        self.addChild(enemyLabel)
        
        userLabel.text = "  0"
        userLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        userLabel.fontColor = #colorLiteral(red: 0.9254902005195618, green: 0.23529411852359772, blue: 0.10196078568696976, alpha: 1.0)
        userLabel.fontSize = 70
        userLabel.position = CGPoint(x: frame.size.width / 2 + 80, y: frame.size.height - 80)
        self.addChild(userLabel)
        
        //winner label
        winLabel.text = ""
        winLabel.fontColor = #colorLiteral(red: 0.9254902005195618, green: 0.23529411852359772, blue: 0.10196078568696976, alpha: 1.0)
        winLabel.fontSize = 100
        winLabel.position = CGPoint(x: frame.size.width / 2 , y: frame.size.height / 2 + 50)
        self.addChild(winLabel)
        
        //user paddle
        ball.name = "ball"
        ball.position = CGPoint(x: frame.size.height / 2, y: frame.size.width / 2)
        ball.setScale(0.14)
        ball.physicsBody = SKPhysicsBody(texture: ball.texture!, size: ball.size)
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.linearDamping = -0.03
        ball.physicsBody?.angularDamping = -0.03
        self.addChild(ball)
        
        //user paddle
        userP.name = "user paddle"
        userP.physicsBody = SKPhysicsBody(rectangleOf: userP.size)
        userP.physicsBody!.isDynamic = false
        userP.physicsBody!.friction = 0
        userP.physicsBody!.restitution = 1
        userP.physicsBody!.linearDamping = 0
        userP.physicsBody?.isDynamic = false 
        userP.physicsBody?.affectedByGravity = false
        userP.position = CGPoint(x: frame.size.width - 100, y: (frame.size.height / 2))
        self.addChild(userP)
        userP.setScale(2)
        
        //enemy paddle 
        enemyP.name = "enemy Paddle"
        enemyP.physicsBody = SKPhysicsBody(rectangleOf: enemyP.size)
        enemyP.physicsBody!.friction = 0
        enemyP.physicsBody!.restitution = 1
        enemyP.physicsBody!.linearDamping = 0
        enemyP.physicsBody?.isDynamic = false 
        enemyP.physicsBody?.affectedByGravity = false
        enemyP.position = CGPoint(x: 100 , y: (frame.size.height / 2))
        self.addChild(enemyP)
        enemyP.setScale(2)
        
        //border
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
        //https://youtu.be/pk1YRxLu8n4
        ball.run(SKAction.playSoundFileNamed( "Music.mp3", waitForCompletion: false))
        
        
        //start game 
        //https://developer.apple.com/documentation/spritekit/skphysicsbody/1519900-applyimpulse
        ball.physicsBody?.applyImpulse(CGVector(dx: -8, dy: -8))
        
        }
    
    
    override func  update(_ currentTime: TimeInterval) {
        //every 60fps 
        
        //follows ball's X postion with a delay. 
        enemyP.run(SKAction.moveTo(y: ball.position.y, duration: TimeInterval(DIFIC)))
        
        //user losing when it goes behind his the paddle
        
        if ball.position.x > userP.position.x + 75 {
            
            enemyP.position = CGPoint(x: 100 , y: (frame.size.height / 2))
            ball.position = CGPoint(x: frame.size.width / 2 , y: (frame.size.height / 2))
            ball.physicsBody?.velocity = CGVector(dx: -8, dy: -8)
            ball.physicsBody?.applyImpulse(CGVector(dx: -8, dy: -8))
            enemyScore += 1 
            enemyLabel.text = "" + String(enemyScore)
            }
        
        //enemy losing when it goes behind his paddle
        if ball.position.x < enemyP.position.x - 75 {
            
            enemyP.position = CGPoint(x: 100 , y: (frame.size.height / 2))
            ball.position = CGPoint(x: frame.size.width / 2 , y: (frame.size.height / 2))
            ball.physicsBody?.velocity = CGVector(dx: 8, dy: 8)
            ball.physicsBody?.applyImpulse(CGVector(dx: 8, dy: 8))
            userScore += 1 
            userLabel.text = " " + String(userScore)
            
        }
        
        // tell user he lost 
        if enemyScore >= 5 {
            //stop ball from movin
            winLabel.text = "YOU LOSE!!!"
            ball.position = CGPoint(x: frame.size.width / 2 , y: (frame.size.height / 2))
            
            //https://developer.apple.com/documentation/spritekit/skphysicsbody/1519635-velocity
            
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
            
            //go to game over scene
            ball.run(moveToNextSceneDelay) {
                let doneScene = GameOverScene(size: self.size)
                self.view!.presentScene(doneScene)
                }
            }
            
        // tell user he won 
        if userScore >= 5 { 
            winLabel.text = "YOU WIN!!!"
            ball.position = CGPoint(x: frame.size.width / 2 , y: (frame.size.height / 2))
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
            
            //go to game over scene
            ball.run(moveToNextSceneDelay) {
                let doneScene = GameOverScene(size: self.size)
                self.view!.presentScene(doneScene)
                }
            }
        }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // moves user's paddle where ever the user's finger in the Y postion
        for touch in touches {
            let location = touch.location(in: self)
            userP.run(SKAction.moveTo(y: location.y, duration: 0))
        }
    }
    
}


//gamer over scene

class GameOverScene: SKScene {
    
    let menuButton = SKSpriteNode(imageNamed:"IMG_1020.PNG")
    let gameOverLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor(red: 1, green:1, blue:1, alpha: 1.0)
        
        menuButton.position = CGPoint(x: frame.size.width / 2, y: frame.size.height/2)
        menuButton.name = "menu button"
        self.addChild(menuButton)
        
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontColor = #colorLiteral(red: 0.9254902005195618, green: 0.23529411852359772, blue: 0.10196078568696976, alpha: 1.0)
        gameOverLabel.fontSize = 80
        gameOverLabel.position = CGPoint(x: frame.size.width / 2, y: frame.size.height - 100)
        self.addChild(gameOverLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "menu button" {
                let diffculiesScene = DifficultyScene(size: self.size)
                self.view!.presentScene(diffculiesScene)
            }
        }
    }
}




// this will be commented out when code moved to Xcode
// set the frame to be the size for your iPad
let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

let scene = GameScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill

let skView = SKView(frame: frame)
skView.showsFPS = true
skView.showsNodeCount = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView

