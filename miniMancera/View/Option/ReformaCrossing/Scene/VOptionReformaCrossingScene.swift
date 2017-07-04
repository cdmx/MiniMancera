import SpriteKit

class VOptionReformaCrossingScene:ViewGameScene<MOptionReformaCrossing>
{
    required init(controller:ControllerGame<MOptionReformaCrossing>)
    {
        super.init(controller:controller)
        physicsWorld.gravity = CGVector.zero
        factoryNodes()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryNodes()
    {
        let model:MOptionReformaCrossing = controller.model
        
        let background:VOptionReformaCrossingBackground = VOptionReformaCrossingBackground(
            controller:controller)
        
        let player:VOptionReformaCrossingPlayer = VOptionReformaCrossingPlayer(
            controller:controller)
        model.player.view = player
        
        let hud:VOptionReformaCrossingHud = VOptionReformaCrossingHud(
            controller:controller)
        model.hud.view = hud
        
        let menu:ViewGameNodeMenu<MOptionReformaCrossing> = ViewGameNodeMenu<MOptionReformaCrossing>(
            controller:controller,
            texture:model.textures.menu)
        model.viewMenu = menu
        
        let title:VOptionReformaCrossingTitle = VOptionReformaCrossingTitle()
        model.title.view = title
        
        let stop:VOptionReformaCrossingStop = VOptionReformaCrossingStop(
            controller:controller)
        model.stop.view = stop
        
        addChild(background)
        addChild(player)
        addChild(hud)
        addChild(menu)
        addChild(stop)
        addChild(title)
    }
    
    //MARK: public
    
    func showCoin(coin:MOptionReformaCrossingCoinItem)
    {
        let soundCoin:SKAction = controller.model.sounds.soundCoin
        controller.playSound(actionSound:soundCoin)
        
        let view:VOptionReformaCrossingCoin = VOptionReformaCrossingCoin(
            controller:controller,
            positionY:coin.positionY)
        coin.view = view
        
        addChild(view)
    }
}
