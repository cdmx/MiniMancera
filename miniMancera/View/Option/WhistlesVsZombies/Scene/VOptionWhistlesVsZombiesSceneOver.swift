import Foundation

class VOptionWhistlesVsZombiesSceneOver:ViewGameScene<MOptionWhistlesVsZombies>
{
    required init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        super.init(controller:controller)
        factoryNodes()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryNodes()
    {
        let textures:MOptionWhistlesVsZombiesTextures = controller.model.textures
        
        let background:VOptionWhistlesVsZombiesBackground = VOptionWhistlesVsZombiesBackground(
            controller:controller)
        
        let info:ViewGameNodeGameOverInfo = ViewGameNodeGameOverInfo(
            title:String.localizedPollutedGarden(
                key:"VOptionWhistlesVsZombiesSceneOver_infoTitle"),
            descr:String.localizedPollutedGarden(
                key:"VOptionWhistlesVsZombiesSceneOver_infoDescr"),
            zPosition:MOptionWhistlesVsZombiesZPosition.GameOverInfo.rawValue)
        
        let title1up:ViewGameNodeGameOverTitle1up = ViewGameNodeGameOverTitle1up(
            text:String.localizedPollutedGarden(
                key:"VOptionWhistlesVsZombiesSceneOver_1up"),
            zPosition:MOptionWhistlesVsZombiesZPosition.GameOverTitle1up.rawValue)
        let titleExit:ViewGameNodeGameOverTitleExit = ViewGameNodeGameOverTitleExit(
            text:String.localizedPollutedGarden(
                key:"VOptionWhistlesVsZombiesSceneOver_exit"),
            zPosition:MOptionWhistlesVsZombiesZPosition.GameOverTitleExit.rawValue)
        
        let player:ViewGameNodeGameOverPlayer<MOptionWhistlesVsZombies> = ViewGameNodeGameOverPlayer<MOptionWhistlesVsZombies>(
            controller:controller,
            texture:textures.playerDefeated)
        
        let button1up:ViewGameNodeGameOver1up<MOptionWhistlesVsZombies> = ViewGameNodeGameOver1up<MOptionWhistlesVsZombies>(
            controller:controller,
            texture:textures.gameOver1up)
        
        let buttonExit:ViewGameNodeGameOverExit<MOptionWhistlesVsZombies> = ViewGameNodeGameOverExit<MOptionWhistlesVsZombies>(
            controller:controller,
            texture:textures.gameOverExit)
        
        addChild(background)
        addChild(info)
        addChild(title1up)
        addChild(titleExit)
        addChild(player)
        addChild(button1up)
        addChild(buttonExit)
    }
}
