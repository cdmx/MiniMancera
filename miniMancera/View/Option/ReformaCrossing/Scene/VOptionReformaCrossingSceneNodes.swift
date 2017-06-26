import SpriteKit

extension VOptionReformaCrossingScene
{
    func factoryNodes()
    {
        let background:VOptionReformaCrossingBackground = VOptionReformaCrossingBackground(
            controller:controller)
        
        let hud:VOptionReformaCrossingHud = VOptionReformaCrossingHud(
            controller:controller)
        self.hud = hud
        
        addChild(background)
        addChild(hud)
        
        showTitle()
    }
    
    //MARK: private
    
    private func showTitle()
    {
        let sceneSize:CGSize = MGame.sceneSize
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let positionY:CGFloat = sceneHeight_2 + kTitleVerticalAdd
        
        let level:NSNumber = controller.model.level as NSNumber
        let levelString:String = String(
            format:String.localizedReformaCrossing(key:"VOptionReformaCrossingScene_labelTitle"),
            level)
        
        let labelTitle:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontGame)
        labelTitle.text = levelString
        labelTitle.fontSize = kFontSize
        labelTitle.fontColor = SKColor.white
        labelTitle.position = CGPoint(x:sceneWidth_2, y:positionY)
        labelTitle.zPosition = MOptionReformaCrossingZPosition.Title.rawValue
        self.labelTitle = labelTitle
        
        addChild(labelTitle)
    }
}
