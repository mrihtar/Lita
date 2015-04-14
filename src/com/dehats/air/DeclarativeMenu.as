package com.dehats.air
{
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	
	public class DeclarativeMenu extends NativeMenu
	{
        public function DeclarativeMenu(XMLMenuDefinition:XML):void
        {
            super();
            addChildrenToMenu(this, XMLMenuDefinition.children());
        }
        
        private function addChildrenToMenu(menu:NativeMenu,
                                children:XMLList):NativeMenuItem
        {
            var menuItem:NativeMenuItem;
            var submenu:NativeMenu;
            
            for each (var child:XML in children)
            {
                if (String(child.@label).length > 0)
                {
                    menuItem = new NativeMenuItem(child.@label);
                    menuItem.name = child.name();
                }
                else
                {
                    menuItem = new NativeMenuItem(child.name());
                    menuItem.name = child.name();
                }
                
                menu.addItem(menuItem);
                
                if (String(child.@equiv).length > 0) menuItem.keyEquivalent = child.@equiv.toString();
                
                if (child.children().length() > 0)
                {
                    menuItem.submenu = new NativeMenu();
                    addChildrenToMenu(menuItem.submenu,child.children());
                }
            }
            return menuItem;

        }
	}
}