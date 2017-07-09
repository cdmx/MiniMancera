import UIKit

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
        let orientation:UIInterfaceOrientation = UIInterfaceOrientation.landscapeLeft
        let textures:MOptionWhistlesVsZombiesTextures = controller.model.textures
        
        let background:VOptionWhistlesVsZombiesBackground = VOptionWhistlesVsZombiesBackground(
            controller:controller)
        
        let info:ViewGameNodeGameOverInfo = ViewGameNodeGameOverInfo(
            title:String.localizedWhistlesVsZombies(
                key:"VOptionWhistlesVsZombiesSceneOver_infoTitle"),
            descr:String.localizedWhistlesVsZombies(
                key:"VOptionWhistlesVsZombiesSceneOver_infoDescr"),
            zPosition:MOptionWhistlesVsZombiesZPosition.GameOverInfo.rawValue,
            orientation:orientation)
        
        let title1up:ViewGameNodeGameOverTitle1up = ViewGameNodeGameOverTitle1up(
            text:String.localizedWhistlesVsZombies(
                key:"VOptionWhistlesVsZombiesSceneOver_1up"),
            zPosition:MOptionWhistlesVsZombiesZPosition.GameOverTitle1up.rawValue,
            orientation:orientation)
        
        let titleExit:ViewGameNodeGameOverTitleExit = ViewGameNodeGameOverTitleExit(
            text:String.localizedWhistlesVsZombies(
                key:"VOptionWhistlesVsZombiesSceneOver_exit"),
            zPosition:MOptionWhistlesVsZombiesZPosition.GameOverTitleExit.rawValue,
            orientation:orientation)
        
        let player:ViewGameNodeGameOverPlayer<MOptionWhistlesVsZombies> = ViewGameNodeGameOverPlayer<MOptionWhistlesVsZombies>(
            controller:controller,
            texture:textures.playerDefeated,
            orientation:orientation)
        
        let button1up:ViewGameNodeGameOver1up<MOptionWhistlesVsZombies> = ViewGameNodeGameOver1up<MOptionWhistlesVsZombies>(
            controller:controller,
            texture:textures.gameOver1up,
            orientation:orientation)
        
        let buttonExit:ViewGameNodeGameOverExit<MOptionWhistlesVsZombies> = ViewGameNodeGameOverExit<MOptionWhistlesVsZombies>(
            controller:controller,
            texture:textures.gameOverExit,
            orientation:orientation)
        
        addChild(background)
        addChild(info)
        addChild(title1up)
        addChild(titleExit)
        addChild(player)
        addChild(button1up)
        addChild(buttonExit)
    }
}
