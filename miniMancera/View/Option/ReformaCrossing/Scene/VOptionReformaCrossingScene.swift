import SpriteKit

class VOptionReformaCrossingScene:ViewGameScene<MOptionReformaCrossing>
{
    required init(controller:ControllerGame<MOptionReformaCrossing>)
    {
        controller.model.startLevel()
        
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
        
        let menu:VOptionReformaCrossingMenu = VOptionReformaCrossingMenu(
            controller:controller)
        model.menu.view = menu
        
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
    
    func createCoinOn(lane:MOptionReformaCrossingLane)
    {/*
        playSound(actionSound:soundCoin)
        
        let coin:MOptionReformaCrossingCoin = MOptionReformaCrossingCoin(
            lane:lane,
            controller:controller)
        
        addChild(coin)*/
    }
}
