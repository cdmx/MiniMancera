import SpriteKit

extension VOptionWhistlesVsZombiesMenu
{
    private static let kFontSize:CGFloat = 16
    private static let kTitleAddPositionY:CGFloat = -70
    
    class func factoryTitle(menuSize:CGSize) -> SKLabelNode
    {
        let sceneHeight:CGFloat = menuSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let positionY:CGFloat = sceneHeight_2 + kTitleAddPositionY
        
        let labelTitle:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontGame)
        labelTitle.text = String.localizedWhistlesVsZombies(key:"VOptionWhistlesVsZombiesMenu_labelTitle")
        labelTitle.fontSize = kFontSize
        labelTitle.fontColor = SKColor.white
        labelTitle.position = CGPoint(x:0, y:positionY)
        
        return labelTitle
    }
    
    func factoryWhistles()
    {
        for item:MOptionWhistlesVsZombiesMenuItem in model.items
        {
            /*
            let whistle:VOptionWhistlesVsZombiesMenuWhistle = VOptionWhistlesVsZombiesMenuWhistle(
                controller:controller,
                modelMenu:model,
                model:item)
            
            addChild(whistle)*/
        }
    }
}
