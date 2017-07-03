import UIKit

class VOptionWhistlesVsZombiesBoard:ViewGameNode<MOptionWhistlesVsZombies>
{
    private(set) var cancel:VOptionWhistlesVsZombiesBoardCancel!
    private let kWhistlesPositionYStart:CGFloat = -110
    private let kWhistlesYSpace:CGFloat = -80
    private let kAlpha:CGFloat = 0.85
    
    override init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        let colour:UIColor = UIColor(white:0, alpha:kAlpha)
        
        super.init(
            controller:controller,
            size:MGame.sceneSize,
            zPosition:MOptionWhistlesVsZombiesZPosition.Board.rawValue,
            colour:colour)
        alpha = 0
        factoryNodes()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneSize:CGSize = MGame.sceneSize
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        position = CGPoint(x:sceneWidth_2, y:sceneHeight_2)
    }
    
    //MARK: private
    
    private func factoryNodes()
    {
        let title:VOptionWhistlesVsZombiesBoardTitle = VOptionWhistlesVsZombiesBoardTitle()
        
        let cancel:VOptionWhistlesVsZombiesBoardCancel = VOptionWhistlesVsZombiesBoardCancel(
            controller:controller)
        self.cancel = cancel
        
        addChild(title)
        addChild(cancel)
        
        factoryWhistles()
    }
    
    private func factoryWhistles()
    {
        let sceneHeight:CGFloat = MGame.sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        var positionY:CGFloat = sceneHeight_2 + kWhistlesPositionYStart
        let types:[MOptionWhistlesVsZombiesWhistleType] = controller.model.whistle.types
        
        for type:MOptionWhistlesVsZombiesWhistleType in types
        {
            guard
            
                let view:VOptionWhistlesVsZombiesBoardWhistle = VOptionWhistlesVsZombiesBoardWhistle(
                    controller:controller,
                    model:type,
                    positionY:positionY)
            
            else
            {
                continue
            }
            
            positionY += kWhistlesYSpace
            type.view = view
            
            addChild(view)
        }
    }
}
