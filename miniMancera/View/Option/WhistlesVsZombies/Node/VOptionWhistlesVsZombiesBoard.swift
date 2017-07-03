import UIKit

class VOptionWhistlesVsZombiesBoard:ViewGameNode<MOptionWhistlesVsZombies>
{
    private(set) var cancel:VOptionWhistlesVsZombiesBoardCancel!
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
        let cancel:VOptionWhistlesVsZombiesBoardCancel = VOptionWhistlesVsZombiesBoardCancel(
            controller:controller)
        self.cancel = cancel
        
        addChild(cancel)
    }
}
