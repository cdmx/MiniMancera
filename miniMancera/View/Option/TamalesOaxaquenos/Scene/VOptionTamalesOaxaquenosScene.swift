import SpriteKit

class VOptionTamalesOaxaquenosScene:ViewGameScene<MOptionTamalesOaxaquenos>
{
    private let kMenuPositionY:CGFloat = 45
    
    required init(controller:ControllerGame<MOptionTamalesOaxaquenos>)
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
        let model:MOptionTamalesOaxaquenos = controller.model
        
        let camera:SKCameraNode = SKCameraNode()
        self.camera = camera
        model.camera.view = camera
        
        let background:VOptionTamalesOaxaquenosBackground = VOptionTamalesOaxaquenosBackground(
            controller:controller)
        
        let player:VOptionTamalesOaxaquenosPlayer = VOptionTamalesOaxaquenosPlayer(
            controller:controller)
        model.player.view = player
        
        let controls:VOptionTamalesOaxaquenosControls = VOptionTamalesOaxaquenosControls(
            controller:controller)
        model.controls.view = controls
        
        let menu:ViewGameNodeMenu<MOptionTamalesOaxaquenos> = ViewGameNodeMenu<MOptionTamalesOaxaquenos>(
            controller:controller,
            texture:model.textures.menu)
        model.viewMenu = menu
        positionMenu(menu:menu)

        camera.addChild(background)
        camera.addChild(controls)
        camera.addChild(menu)
        
        factoryArea()
        addChild(camera)
        addChild(player)
    }
    
    private func factoryArea()
    {
        factoryPerspective()
        factoryFloor()
    }
    
    private func factoryPerspective()
    {
        let items:[MOptionTamalesOaxaquenosAreaPerspectiveItem] = controller.model.area.perspectiveItems
        
        for item:MOptionTamalesOaxaquenosAreaPerspectiveItem in items
        {
            let node:VOptionTamalesOaxaquenosPerspective = VOptionTamalesOaxaquenosPerspective(
                controller:controller,
                model:item)
            
            addChild(node)
        }
    }
    
    private func factoryFloor()
    {
        let items:[MOptionTamalesOaxaquenosAreaFloorItemProtocol] = controller.model.area.floorItems
        
        for item:MOptionTamalesOaxaquenosAreaFloorItemProtocol in items
        {
            guard
                
                let node:ViewGameNode<MOptionTamalesOaxaquenos> = item.factoryNode(
                    controller:controller)
                
            else
            {
                continue
            }
            
            addChild(node)
        }
    }
    
    private func positionMenu(menu:ViewGameNodeMenu<MOptionTamalesOaxaquenos>)
    {
        guard
            
            let modelTexture:MGameTexture = menu.modelTexture
            
        else
        {
            return
        }
        
        let sceneSize:CGSize = MGame.sceneSize
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let width_2:CGFloat = modelTexture.width_2
        let positionX:CGFloat = width_2 - sceneWidth_2
        let positionY:CGFloat = sceneHeight_2 - kMenuPositionY
        menu.position = CGPoint(x:positionX, y:positionY)
    }
}
